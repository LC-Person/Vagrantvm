# User Files
this folder will contain your information needed to acces Fabric Virtual machines aswell as a token to use the fabric API, feal free to ether replace the files pre-created, or add content to the empty files by copy-pasteing your information

## What to place inside this folder
In this folder you will need to upload the following items:
    - Fabric Sliver private key
    - Fabric Sliver public key
    - Fabric Bastion Private key
    - Fabric Bastion Public key
    - Your Fabric Token
After you have uploaded these items be sure to update the "USRinfo.sh" file with the corresponding names that you have given each item, be sure to use the same name.


## Aquiering items:


### SSH Keys:
The SSH keys are needed for the fabric api to create slices, additionaly you need these keys to access the machines via ssh tunnels. To obtain/create these keys you can follow this guide or follow these instructions [guide](https://learn.fabric-testbed.net/knowledge-base/logging-into-fabric-vms/)

1. Navigate to [portal.fabric-testbed.net](portal.fabric-testbed.net) and sign in to your fabric account
2. Navigate to [https://portal.fabric-testbed.net/experiments#sshKeys](https://portal.fabric-testbed.net/experiments#sshKeys)
3. Generate your sliver key by filling out the text boxes "Name" & "Description"
4. Download both of these items, **Keep your Private Key safe**, you will not be able to get it after you leave this page.
5. Click on the "Bastion" tab
6. Generate your bastion key by filling out the text boxes "Name" & "Description"
7. Download both of these items, **Keep your Private Key safe**, you will not be able to get it after you leave this page.
8. Move these keys from your "Downloads" folder into the "UserFiles" Directory we are using.

### Token:
Since we are not using 