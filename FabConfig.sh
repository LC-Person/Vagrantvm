#requirements:
#	display:
#		- 64mb
#		- 3D accel
#	Sys:
#		- 4096mb
#		- 2 cores

sudo apt-get update
echo "install GUI"
# for GUI
# only works when user because of menu
sudo DEBIAN_FRONTEND=noninteractive apt-get install xubuntu-desktop -y
#sudo DEBIAN_FRONTEND=noninteractive apt-get install lxqt sddm -y

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
# variables get reset after reboot
script_path="/etc/profile.d/fabricVar.sh"
uploadFolder="testUpload"

touch $script_path
echo "export FABRIC_CREDMGR_HOST=cm.fabric-testbed.net" >> "$script_path"
echo "export FABRIC_ORCHESTRATOR_HOST=orchestrator.fabric-testbed.net" >> "$script_path"
echo "export FABRIC_TOKEN_LOCATION=/home/vagrant/$uploadFolder/id_token.json" >> "$script_path"

echo "jupyeter lab installation"

#install python notebook
sudo -u vagrant pip install jupyter
sudo chown -R vagrant /home/vagrant
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
sudo -u vagrant mkdir /home/vagrant/work
sudo -u vagrant mkdir /home/vagrant/work/fabric_config/
cp /home/vagrant/$uploadFolder/Fabric_Vagrant_VM_BASTION /home/vagrant/work/fabric_config/fabric_bastion_key
chmod 600 /home/vagrant/work/fabric_config/fabric_bastion_key
#sudo sed -i 's/python/\/usr\/bin\/python3.9/' ~/.local/share/jupyter/kernels/python3/kernel.json


echo "starting reboot:"
echo "After reboot you can start using the machine"
whoami
reboot