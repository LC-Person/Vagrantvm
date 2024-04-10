# Setup Folder
This folder contains usefull scripts for the configuration of your enviorment
- configure.py is a script that verifies the configuration of the fablib instalation
- USRinfo.sh is a file that contains all of your user information.
- Re-Configure.sh is a script that you are able to run for updates in your enviorment

## USRinfo.sh
This file needs to eddited to include any configuration changes that you have made to your enviorment aswell as your user information to be able to use the Fablib api

- **FABRIC_BASTION_LOGIN** can be found on the fabric portal if you navigate to "experiments" and then to "Manage SSH Keys", you can find it at the top, next to "Bastion login"
- **FABRIC_PROJECT_ID** can be found on the fabric portal if you navigate to "experiments" and then to "Manage SSH Keys",

- *SSH Key information*: the ssh keys used can be created in the portal under "experiments", then "Manage SSH keys", alternatively you can click [here](https://portal.fabric-testbed.net/experiments#sshKeys). For detailed instructions you can navigate to this [guide](https://learn.fabric-testbed.net/knowledge-base/logging-into-fabric-vms/)
    - **FABRIC_BASTION_KEY** comes with a default value "Fabric_Vagrant_VM_BASTION", you can change this value if you decide to upload keys with different names, or leave it as is if you decided to copy and paste the corresponding values.
    - **FABRIC_SLIVER_KEY** comes with a default value "Fabric_Vagrant_VM", you can change this value if you decide to upload keys with different names, or leave it as is if you decided to copy and paste the corresponding values.
- **FABRIC_TOKEN_NAME** comes with a default value "id_token.json", you can change this value if you decide to upload keys with different names, or leave it as is if you decided to copy and paste the corresponding values. This token gan be obtained on the portal by navigating to "Experiments" and then "Manage Tokens", you will be redericted to "[https://cm.fabric-testbed.net/](https://cm.fabric-testbed.net/)". you can follow this [guide](https://learn.fabric-testbed.net/knowledge-base/obtaining-and-using-fabric-api-tokens/) for instructions

## Reconfigure.sh 
This script allowes you to re-configure your enviorment by just running ```./Re-Configure.sh```. 
This is a usefull tool incase one of your keys expires, or a token expires, and you need to update the enviorment without rebooting the VM, the steps to running this script are:
- move the updated versions of the items into the UserFiles folder inside of your machine 
- update the "Userinfo.sh" file
- run ```Re-Configure.sh``` 

