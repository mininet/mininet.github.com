---
layout: page
title: "Mininet VM setup notes"
comments: false
sharing: true
footer: true
root: /
---
The Mininet VM is meant to speed up Mininet installation, plus make it easy to run on non-Linux platforms. The VM works on Windows, Mac, and Linux, through VMware, VirtualBox, QEMU and KVM.

After downloading the VM, you'll run a few steps to customize it for your setup. This won't take long.

<!-- %TOC% -->


VM Setup
---------


### Download the Mininet VM

Download the Mininet VM at https://github.com/downloads/mininet/mininet/mininet-vm-ubuntu11.10-052312.vmware.zip

The VM comes out to ~800MB compressed and ~2GB uncompressed. It includes a disk image in VMware's `.vmdk` (virtual machine disk) format, which can be used by most virtualization systems.

Download and install a virtualization program such as: [VMware Workstation](http://www.vmware.com/products/workstation/) for Windows or Linux, [VMware Fusion](http://www.vmware.com/products/fusion) for Mac, [VirtualBox](http://www.virtualbox.org/wiki/Downloads) ( **free!**, GPL) for any platform, or `qemu` ( **free!**, GPL) for Linux. If you already have VMware, we find that it runs Mininet somewhat faster than VirtualBox. However, VirtualBox is free to download and distribute, which is a definite advantage!

### Boot VM

Add the VM and start it up, in the virtualization program of your choice:

**VirtualBox**: Create a new VM using the `.vmdk` as the hard disk image, then start it up.

**VMware**: Just double-click the `.vmx` file.

VMware may ask you to install VMware tools on the VM - if it asks, decline. Everything graphical in the tutorial is done via X forwarding through SSH (in fact, the VM doesn't have a desktop manager installed), so the VMware tools are unnecessary unless you wish to install an X11/Gnome/etc. environment in your VM.

**Qemu/KVM**:

    qemu-system-i386 -m 512 MininetVM.vmdk -net nic,model=virtio -net user,net=192.168.101.0/24,hostfwd=tcp::8022-:22

This will set up `ssh` forwarding from the VM to host port 8022.

**Parallels**: Use Parallels Transporter to convert the `.vmdk` file to an `.hdd` image that Parallels can use, and then create a new VM using that `.hdd` image as its virtual drive.


### Login to VM

Log in to the VM, using the following params:
* Username: **openflow**
* Password: **openflow**
The root account is not enabled for login; you can use sudo to run a command as superuser.


### SSH into VM

First, find the VM's IP address, which for VMware is probably in the range 192.168.x.y. In the VM console:

    /sbin/ifconfig eth0

You may want to add the address to your host PC's /etc/hosts file to be able to SSH in by name, if it's Unix-like. For example, add a line like this for OS X:

    192.168.x.y openflow

where 192.168.x.y is replaced by the VM's IP address.

SSH in to the host. Use -Y to enable trusted X forwarding, for use with Wireshark later - we assume the VM is running locally, and that the additional precautions of -X w/SSH are unnecessary.

    ssh -Y openflow@openflow

If you're running the VM under QEMU/KVM with -net user and the `hostfwd` option as recommended above, the VM IP address is irrelevant. Instead you tell SSH to connect to port 8022 on the host:

    ssh -Y -p 8022 openflow@localhost

### Install preferred editor

Install your preferred editor. For example, to install vim:

    sudo apt-get -y install vim


Optional VM Customization
--------------------------

These commands are optional, and may be useful for your setup:

### Setup SSH auto-login

These steps let you log in via SSH without needing to enter a password. If you use the console from your virtualization software natively, then this step isn't needed.

Check for `~/.ssh/id_rsa` or `~/.ssh/id_dsa`. If you can't find either of these files, then you'll want to generate an SSH key.

On a unix-like system (OS X or Linux - you'll need other instructions for Windows) - on the host, not the VM:

	ssh-keygen -t rsa

To speed up future SSH connections, add your host's public key to the new VM. Also on the host, not the VM:

    scp ~/.ssh/id_rsa.pub openflow@openflow:~/

Now, on the VM (SSH in first):

    cd ~/ && mkdir -p .ssh && chmod 700 .ssh && cd .ssh && touch authorized_keys2 && chmod 600 authorized_keys2 && cat ../id_rsa.pub >> authorized_keys2 && rm ../id_rsa.pub && cd ..

Now you should be able to log in without entering a password.


Mininet Walkthrough
--------------------

(Highly recommended) Head over to the [Walkthrough](walkthrough), which shows common commands. It'll be really useful, trust us.
