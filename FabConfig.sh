#requirements:
#	display:
#		- 64mb
#		- 3D accel
#	Sys:
#		- 4096mb
#		- 2 cores

$USER_FOLDER="User_Files"
$CONFIG_FOLDER="Setup_Folder"
$USR_HOME="/home/vagrant"

sudo apt-get update
echo "install GUI"
#Install GUI
sudo DEBIAN_FRONTEND=noninteractive apt-get install xubuntu-desktop -y

echo "install python"
# get python 3.9.10
sudo apt-get install python3-pip -y
sudo apt-get install python3.9 -y
sudo apt-get install python3.9-dev -y

echo "restruct path on python command"
# update python command to reflect new version
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.9 2
sudo update-alternatives --config python
sudo apt-get install python3.9-distutils
sudo wget https://bootstrap.pypa.io/get-pip.py
sudo python3.9 get-pip.py
sudo update-alternatives --config python

echo "Set Variables"
# Load persistant variables after reboot
script_path="/etc/profile.d/fabricVar.sh"

touch $script_path
echo "export FABRIC_CREDMGR_HOST=cm.fabric-testbed.net" >> "$script_path"
echo "export FABRIC_ORCHESTRATOR_HOST=orchestrator.fabric-testbed.net" >> "$script_path"
echo "export FABRIC_TOKEN_LOCATION=$USR_HOME/$CONFIG_FOLDER/id_token.json" >> "$script_path"
source /etc/profile.d/fabricVar.sh

#Load user information
source $USR_HOME/$CONFIG_FOLDER/USRinfo.sh
echo "jupyeter lab installation"

#install python notebook
sudo -u vagrant pip install jupyter
sudo chown -R vagrant $USR_HOME
sudo -u vagrant pip install -U psutil

#pip install jupyter

echo "install fablib"

#install fablib
#pip3 install virtualenv virtualenvwrapper
#sudo -u vagrant virtualenv fabric-jupyter
sudo -u vagrant pip install fabrictestbed
sudo -u vagrant pip install fabrictestbed-extensions

#websocket enabled? no, chek the .json file
echo "download jupyter examples"
#download jupyter examples
git clone https://github.com/fabric-testbed/jupyter-examples.git

echo "setup fabric enviorment"
sudo -u vagrant mkdir $USR_HOME/work
sudo -u vagrant mkdir $USR_HOME/work/fabric_config/
sudo -u vagrant cp $USR_HOME/$uploadFolder/$FABRIC_BASTION_KEY $USR_HOME/work/fabric_config/fabric_bastion_key
sudo -u vagrant cp $USR_HOME/$uploadFolder/$FABRIC_TOKEN_NAME $USR_HOME/work/fabric_config/.id_token.json

echo "configure enviorment (hopefully)"
echo "test: $FABRIC_PROJECT_ID"
sudo -u vagrant python $USR_HOME/SetupFolder/configure.py
chmod 600 $USR_HOME/work/fabric_config/fabric_bastion_key

echo "starting reboot:"
echo "After reboot you can start using the machine"
reboot