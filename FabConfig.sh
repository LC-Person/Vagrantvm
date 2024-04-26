#requirements:
#	display:
#		- 64mb
#		- 3D accel
#	Sys:
#		- 2048mb
#		- 2 cores

USER_FOLDER="localFiles/UserFiles"
CONFIG_FOLDER="localFiles/SetupFolder"
USR_HOME="/home/vagrant"

sudo apt-get update

printf  "\ninstall python\n"
# get python 3.9.10
sudo apt-get install python3-pip -y
sudo apt-get install python3.9 -y
sudo apt-get install python3.9-dev -y

printf  "restruct path on python command"
# update python command to reflect new version
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.9 2
sudo update-alternatives --config python
sudo apt-get install python3.9-distutils
sudo wget https://bootstrap.pypa.io/get-pip.py
sudo python3.9 get-pip.py
sudo update-alternatives --config pythonz

printf  "\nSet Variables\n"
# Load persistant variables after reboot
script_path="/etc/profile.d/fabricVar.sh"

touch $script_path
echo "export FABRIC_CREDMGR_HOST=cm.fabric-testbed.net" >> "$script_path"
echo "export FABRIC_ORCHESTRATOR_HOST=orchestrator.fabric-testbed.net" >> "$script_path"
echo "export FABRIC_TOKEN_LOCATION=$USR_HOME/work/fabric_config/id_token.json" >> "$script_path"
echo "JUPYTER_LAB_TOKEN=fabric" >> "$script_path"

echo "echo 'Loading jupyterhub...'"  >> "$script_path"
echo "$USR_HOME/.local/bin/jupyter-lab --ip 0.0.0.0 -p 8888 --LabApp.token=\$JUPYTER_LAB_TOKEN"  >> "$script_path"
echo "echo 'please navigate to http://localhost:8888/'"  >> "$script_path"
source $script_path

#Load user information
source $USR_HOME/$CONFIG_FOLDER/USRinfo.sh
printf  "\njupyeter lab installation\n"

#install python notebook
sudo -u vagrant pip install jupyter
sudo chown -R vagrant $USR_HOME
sudo -u vagrant pip install -U psutil

printf  "\nInstalling JupyterHub enviorment requirements\n"
sudo -u vagrant pip install -r $USR_HOME/$CONFIG_FOLDER/requirements.txt

printf  "\ninstall fablib\n"

#install fablib
#sudo -u vagrant pip install fabrictestbed
sudo -u vagrant pip install fabrictestbed-extensions

#websocket enabled? no, chek the .json file
printf  "\ndownload jupyter examples\n"
#download jupyter examples
sudo -u vagrant  git clone https://github.com/fabric-testbed/jupyter-examples.git

printf  "setup fabric enviorment"


sudo -u vagrant mkdir ${USR_HOME}/work
printf  "\nFabric config exists\n"
sudo -u vagrant mkdir $USR_HOME/work/fabric_config/

#variable error
FABRIC_BASTION_KEY=$(echo "$FABRIC_BASTION_KEY" | tr -d '\r')
CPsource=${USR_HOME}/${USER_FOLDER}/${FABRIC_BASTION_KEY}
CPpaste=${USR_HOME}/work/fabric_config/fabric_bastion_key
sudo -u vagrant sudo -u vagrant cp "$CPsource" "$CPpaste"
CPsource=${USR_HOME}/${USER_FOLDER}/${FABRIC_TOKEN_NAME}
CPpaste=${USR_HOME}/work/fabric_config/id_token.json
sudo -u vagrant cp "$CPsource" "$CPpaste"
CPpaste=${USR_HOME}/.tokens.json
sudo -u vagrant cp "$CPsource" "$CPpaste"



printf  "\nconfigure enviorment\n"
sudo -u vagrant python ${USR_HOME}/${CONFIG_FOLDER}/configure.py
chmod 600 ${USR_HOME}/work/fabric_config/fabric_bastion_key
chmod +x ${USR_HOME}/${CONFIG_FOLDER}/Re-Configure.sh

rm get-pip.py

echo "starting reboot:"
echo "After reboot you can start using the machine"
reboot