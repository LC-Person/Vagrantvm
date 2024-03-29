platform = RUBY_PLATFORM.downcase
default_box = "ubuntu/focal64"

if platform.include?("arm")
  # Set the box to tknerr/ubuntu2004-desktop for ARM processors
  default_box = "tknerr/ubuntu2004-desktop"
end

puts "Using Vagrant box: #{default_box}"

Vagrant.configure("2") do |config|
  config.vm.box = default_box
  config.vm.provider "virtualbox" do |vb|
     # Customize the amount of memory on the VM:
     vb.memory = "4096"    
     vb.customize ["modifyvm", :id, "--nested-hw-virt", "on"]
     vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
     vb.customize ["modifyvm", :id, "--vram", "64"]  
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true
  end
  config.vm.provision "file", source: "./TestUpload", destination: "/home/vagrant/testUpload"
  config.vm.provision "shell", path: "./FabConfig.sh"
end
