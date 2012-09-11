---
layout: page
title: "Download/Get Started with Mininet"
date: 2012-09-10 18:57
comments: false
sharing: false
footer: true
---
The easiest way to get started is to **download a pre-packaged Mininet/Ubuntu VM**. This VM includes Mininet itself, all OpenFlow binaries and tools pre-installed, and tweaks to the kernel configuration to support larger Mininet networks.


Option 1: Mininet VM Installation (recommended)
------------------------------------------------
VM installation is the easiest and most foolproof way of installing Mininet, so it's what we recommend to start with.

Follow these steps for a VM install:

1. Download the [Mininet VM image](https://github.com/downloads/mininet/mininet/mininet-vm-ubuntu11.10-052312.vmware.zip) . This will take some time. It's ~800MB-1GB, compressed.

1. Download and install a virtualization system. We recommend [VirtualBox](http://www.virtualbox.org/wiki/Downloads) (free, GPL) because it is **free** and works on OS X, Windows, and Linux (though it's slightly slower than VMware in our tests.) You can also use [Qemu](http://qemu.org) for any platform, [VMware Workstation](http://www.vmware.com/products/workstation/) for Windows or Linux, or [VMware Fusion](http://www.vmware.com/products/fusion) for Mac, [KVM](http://www.linux-kvm.org) (free, GPL) for Linux.

2. Sign up for the `mininet-discuss` mailing list at https://mailman.stanford.edu/mailman/listinfo/mininet-discuss. This is the source for Mininet **support** and discussion with the friendly Mininet community. ;-)

3. Run through the [VM Setup Notes](vm-setup-notes) to log in to the VM and install Mininet code on it.

4. Follow the [Walkthrough](Walkthrough) to get familiar with Mininet commands and typical usage.

Once you've completed the [Walkthrough](Walkthrough), you should have a clear idea for what Mininet is and what you might use it for. If you are interested in OpenFlow and Software-Defined Networking, you will want to complete the [OpenFlow tutorial](http://www.openflow.org/wk/index.php/OpenFlow_Tutorial) as well. Good luck, and have fun!


Option 2 on *Ubuntu 11.10 only*: Native Mininet installation
------------------------------------------------------

To find out which version of Ubuntu you are running, run the command

    lsb_release -a

These instructions are for 11.10 only (for 12.04, see below!)

If you want to install natively on Ubuntu 11.10 the basic technique is:

    git clone git://github.com/mininet/mininet
    mininet/util/install.sh -a

This takes about 15-20 minutes and will install everything that is included in the Mininet VM, including NOX classic/destiny + tutorial code, the OpenFlow wireshark dissector, etc..

Alternately, it may be possible to install a "minimal" configuration using

    mininet/util/install.sh -fnv

This will install the reference OpenFlow switch and controller, Mininet and its dependencies, and Open vSwitch.

Option 2 on *Ubuntu 12.04 LTS only*: (experimental) Native installation via `install-precise` branch
------------------------------------------------------

We are currently working on revising Mininet 1.0 for installation on 12.04. You are welcome to try installing it, although some features may not work yet.

First, if you have upgraded from 11.10 and an earlier installation of Mininet, make sure you *remove all traces of earlier versions of Open vSwitch from `/usr/local`*:

    sudo rm /usr/local/bin/ovs*
    sudo rm /usr/local/sbin/ovs*

If you are doing a full install, you will also wish to rename your `openflow` and `noxcore` directories

    mv openflow openflow-old
    mv noxcore noxcore-old

The basic technique to install the `install-precise` branch of Mininet 1.0 natively on Ubuntu 12.04 is:

    git clone git://github.com/mininet/mininet
    cd mininet
    git fetch
    git checkout -b install-precise origin/devel/install-precise
    util/install.sh -a

Make sure you are installing from the *install-precise* branch.

The full installation takes about 15-20 minutes and will install everything that is included in the Mininet VM, including NOX classic/destiny + tutorial code, the OpenFlow wireshark dissector, etc..

Alternately, it may be possible to install a "minimal" configuration using

    mininet/util/install.sh -fnv

This will install the reference OpenFlow switch and controller, Mininet and its dependencies, and Open vSwitch.
