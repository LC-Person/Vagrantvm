USER_FOLDER="localFiles/UserFiles"
CONFIG_FOLDER="localFiles/SetupFolder"
USR_HOME="/home/vagrant"
source $USR_HOME/$CONFIG_FOLDER/USRinfo.sh

FABRIC_BASTION_KEY=$(echo "$FABRIC_BASTION_KEY" | tr -d '\r')
sudo chmod 664 $USR_HOME/work/fabric_config/fabric_bastion_key
sudo -u vagrant cp $USR_HOME/$USER_FOLDER/$FABRIC_BASTION_KEY $USR_HOME/work/fabric_config/fabric_bastion_key
sudo -u vagrant cp $USR_HOME/$USER_FOLDER/$FABRIC_TOKEN_NAME $USR_HOME/work/fabric_config/id_token.json

echo "configure enviorment"
python $USR_HOME/$CONFIG_FOLDER/configure.py
sudo chmod 600 $USR_HOME/work/fabric_config/fabric_bastion_key