platform = RUBY_PLATFORM.downcase
default_box = "ubuntu/focal64"

if platform.include?("arm")
  # Set the box to tknerr/ubuntu2004-desktop for ARM processors
  default_box = "ilker/ubuntu2004"
end

puts "Using Vagrant box: #{default_box}"
puts "User Plataform: #{platform}"

Vagrant.configure("2") do |config|
  config.vm.box = default_box

  config.vm.provider "virtualbox" do |vb|
     # Customize the amount of memory on the VM:
     vb.memory = "2048"    
     vb.customize ["modifyvm", :id, "--nested-hw-virt", "on"]
     vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
     vb.customize ["modifyvm", :id, "--vram", "64"]  
     
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true
  end
  
  puts "Mapping VM port 8888 to local 8888"
  config.vm.network "forwarded_port", guest: 8888, host: 8888

  config.vm.synced_folder ".", "/home/vagrant/localFiles", disabled: false
  #config.vm.provision "file", source: "./UserFiles", destination: "/home/vagrant/User_Files"
  #config.vm.provision "file", source: "./SetupFolder", destination: "/home/vagrant/Setup_Folder"
  config.vm.provision "shell", path: "./FabConfig.sh"
  
end
