# This is a demo of the Vagrant machine creation
the following are instructions to run

## Prerequisits
- Install Vagrant
- Install Oracle Virtualbox

## instructions
1) download using git clone
2) run "vagrant up" within the directory that was created when cloning

the following steps should run automatically after running "vagrant up"

1- Vagrant config: The current version uses about 4GB of ram, 64MB video memory (these might change later on). when allocated it usually takes about 2-3 minutes

2- Gui config: this step takes about 20 minutes, if we want to run python notebooks, I think we might need a gui for the machine rather than only using ssh, i chose xubuntu-desktop for now but this might change if i find something that boots faster and is still usable. Let me know any suggestions.

3.- installing python 3.9: the machine comes in with 3.8 but we need 3.9 to run fabric. I also change the python command to reflect 3.9, otherwise it causes errors when installing fablib (1-2 min)

4- Installing fablib: install fablib using the git-pip link here, the first pip install does not seem to work (3-5 min)

5- Install JupyterLab (this might change) currently i am having problems trying to locate the kernel when using the notebooks (1-2 min)

6- install jupyter-examples (<1 min)

After initial configuration the machine should boot within 3 minutes every time, default logins are:

username = vagrant

password = vagrant

# current version information:

- does not automatically configure fabric enviorment to set up your enviorment, this will come in the next update to the files
- you need to create the "work/fabric_config" directories and move your keys here before using
