# This is a demo of the Vagrant machine creation
the following are instructions to run

## Prerequisits
- Install Vagrant
- Install Oracle Virtualbox

## instructions

### To Download the Repository and execute the code
Simply follow these instructions on your enviorment
1- Open you prefered terminal option (Powershell, Terminal, CMD)
2- make a directory "Fabric Vagrant Machine" and move into this directory
3- download using git clone: ```git clone https://github.com/LC-Person/Vagrantvm.git```
4- Modify the contents or copy your information into the "UserFiles" directory click (here)[https://github.com/LC-Person/Vagrantvm] for more information
5- Modify the contents of "USRinfo.sh" insde "SetupFolder" to reflect the changes in the "UserFiles" deriectory click (here) for more information
6- run "vagrant up"

### What the executed code does
the following steps should run automatically after running "vagrant up"

1- Vagrant config: The current version uses about 4GB of ram, 64MB video memory (these might change later on). when allocated it usually takes about 2-3 minutes

2- Gui config: this step takes about 20 minutes, A gui is nessesary when creating this machine to be able to run the python notebooks that can be used in the fabric examples, you can skip this step if you are running your own experiments in fabric and do not need notebooks to execute your experiments

3.- Installing python 3.9: the machine comes in with 3.8 but we need 3.9 to run fablib (1-2 min)

4- Installing fablib: install fablib using the following command ``` sudo -u vagrant pip install fabrictestbed``` and ``` sudo -u vagrant pip install fabrictestbed-extensions``` (3-5 min)

5- Install JupyterLab to run the notebooks (1-2 min)

6- install jupyter-examples (<1 min)

After initial configuration the machine should boot within 3 minutes every time, default logins are:

username = vagrant
password = vagrant

# current version information:
- does not automatically configure fabric enviorment to set up your enviorment, this will come in the next update to the files
