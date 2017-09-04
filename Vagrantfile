# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "ubuntu", primary: true do |ubuntu_config|
    ubuntu_config.vm.box = "wholebits/ubuntu17.04-64"
    ubuntu_config.vm.network "private_network", ip: "192.168.10.100"

    ubuntu_config.vm.synced_folder "./experiment", "/experiment", type: "nfs"
    ubuntu_config.vm.synced_folder "./libusdt", "/libusdt", type: "nfs"
    ubuntu_config.vm.synced_folder "./dtrace4linux", "/dtrace", type: "nfs"
    ubuntu_config.vm.synced_folder "./node-dtrace-provider", "/node-dtrace-provider", type: "nfs"

    ubuntu_config.vm.provision "shell", path: "install.sh", privileged: false
  end

  config.vm.define "bsd", autostart: false do |bsd_config|
    bsd_config.vm.box = "freebsd/FreeBSD-10.3-STABLE"
    bsd_config.vm.guest = :freebsd
    bsd_config.ssh.shell = "sh"
    bsd_config.vm.base_mac = "080027D14C66"
    bsd_config.vm.network "private_network", ip: "192.168.10.100"

    bsd_config.vm.synced_folder "./experiment", "/experiment", type: "nfs"
    bsd_config.vm.synced_folder "./libusdt", "/libusdt", type: "nfs"
    bsd_config.vm.synced_folder "./dtrace4linux", "/dtrace", type: "nfs"
    bsd_config.vm.synced_folder "./node-dtrace-provider", "/node-dtrace-provider", type: "nfs"
  end
end
