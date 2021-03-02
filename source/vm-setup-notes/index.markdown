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

{:toc}


VM Setup
---------


### Download the Mininet VM

Download the Mininet VM from <https://github.com/mininet/mininet/wiki/Mininet-VM-Images> .

The VM comes out to 1GB compressed and ~2GB uncompressed. It is an OVF (Open Virtualization Format) virtual machine image
which can be imported by most virtual machine monitors.

Download and install a virtualization program such as: [VMware Workstation](http://www.vmware.com/products/workstation/) for Windows or Linux, [VMware Fusion](http://www.vmware.com/products/fusion) for Mac, [VirtualBox](http://www.virtualbox.org/wiki/Downloads) ( **free!**, GPL) for any platform, or `qemu` ( **free!**, GPL) for Linux. If you already have VMware, we find that it runs Mininet somewhat faster than VirtualBox. However, VirtualBox is free to download and distribute, which is a definite advantage!

### Boot VM

Add the VM and start it up, in the virtualization program of your choice:

**VirtualBox**:

0. Usually you can just double-click on the `.ovf` file and import it.

1. If you get errors importing the `.ovf` file, you can simply create a new VM of the appropriate type (e.g. Linux, Ubuntu 64-bit) and use the `.vmdk` file as the virtual hard disk for the new VM.

2. Select "settings," and add an additional *host-only network adapter* that you can
use log in to the VM image. Start the VM.

3. For more information on setting up networking in VirtualBox,
   you may wish to check out these
   [VirtualBox specific instructions](https://github.com/mininet/openflow-tutorial/wiki/VirtualBox-specific-Instructions)

**VMware**: Import the OVF file, then start the VM.

VMware may ask you to install VMware tools on the VM - if it asks, decline. Everything graphical in the tutorial is done via X forwarding through SSH (in fact, the VM doesn't have a desktop manager installed), so the VMware tools are unnecessary unless you wish to install an X11/Gnome/etc. environment in your VM.

**Qemu/KVM**:

<!--

Convert the VMDK to QCOW2 format first - directly using VMDK as a qemu input [appears to be broken](https://mailman.stanford.edu/pipermail/mininet-discuss/2012-December/001447.html):

    qemu-img convert -O qcow2 mininet-vm-disk1.vmdk mininet-vm-disk1.qcow2

-->

For Qemu, something like the following should work:

    qemu-system-x86_64 -m 2048 mininet-vm-disk1.vmdk -net nic,model=virtio -net user,net=192.168.101.0/24,hostfwd=tcp::8022-:22

For KVM:

    sudo qemu-system-x86_64 -machine accel=kvm -m 2048 mininet-vm-disk1.vmdk -net nic,model=virtio -net user,net=192.168.101.0/24,hostfwd=tcp::8022-:22

The above commands will set up `ssh` forwarding from the VM to host port 8022.

For a 32-bit VM image, use `qemu-system-i386`.

**Parallels**: Use Parallels Transporter to convert the `.vmdk` file to an `.hdd` image that Parallels can use, and then create a new VM using that `.hdd` image as its virtual drive. Start the VM.


### Log in to VM

Log in to the VM, using the following name and password:

    mininet-vm login: mininet
    Password: mininet

(some older VM images may use `openflow`/`openflow` instead)
The `root` account is not enabled for login; you can use `sudo` to run a command with superuser privileges.

### SSH into VM

First, find the VM's IP address, which for VMware is probably in the range 192.168.x.y. In the VM console:

    ifconfig eth0

Note: VirtualBox users who have set up a host-only network on `eth1` should use

    sudo dhclient eth1   # make sure that eth1 has an IP address
    ifconfig eth1

You may want to add the address to your host PC's /etc/hosts file to be able to SSH in by name, if it's Unix-like. For example, add a line like this for OS X:

    192.168.x.y mininet-vm

where 192.168.x.y is replaced by the VM's IP address.

SSH into the VM. We assume the VM is running locally, and that the additional precautions of `ssh -X` are unnecessary. `ssh -Y` also has no authentication timeout by default.

    ssh -Y mininet@mininet-vm

If you're running the VM under QEMU/KVM with -net user and the `hostfwd` option as recommended above, the VM IP address is irrelevant. Instead you tell SSH to connect to port 8022 on the host:

    ssh -Y -p 8022 mininet@localhost


Optional VM Customization
--------------------------

These commands are optional, and may be useful for your setup:

### Set up SSH auto-login

These steps let you log in via `ssh` without needing to enter a password. If you use the console from your virtualization software natively, then this step isn't needed.

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

(Highly recommended) Head over to the [Walkthrough](/walkthrough), which shows common commands. It'll be really useful, trust us.
