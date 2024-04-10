USER_FOLDER="User_Files"
CONFIG_FOLDER="Setup_Folder"
USR_HOME="/home/vagrant"
source $USR_HOME/$CONFIG_FOLDER/USRinfo.sh

sudo chmod 664 $USR_HOME/work/fabric_config/fabric_bastion_key
sudo -u vagrant cp $USR_HOME/$USER_FOLDER/$FABRIC_BASTION_KEY $USR_HOME/work/fabric_config/fabric_bastion_key
sudo -u vagrant cp $USR_HOME/$USER_FOLDER/$FABRIC_TOKEN_NAME $USR_HOME/work/fabric_config/id_token.json

echo "configure enviorment"
sudo -u vagrant python $USR_HOME/$CONFIG_FOLDER/configure.py
sudo chmod 600 $USR_HOME/work/fabric_config/fabric_bastion_key