---
layout: page
title: "Download/Get Started with Mininet"
comments: false
sharing: false
footer: true
---
The easiest way to get started is to **download a pre-packaged Mininet/Ubuntu VM**. This VM includes Mininet itself, all OpenFlow binaries and tools pre-installed, and tweaks to the kernel configuration to support larger Mininet networks.

*(These instructions are for Mininet 2.0.0 - for earlier versions, go to the bottom of this page.)*

Option 1: Mininet VM Installation (recommended)
------------------------------------------------
VM installation is the easiest and most foolproof way of installing Mininet, so it's what we recommend to start with.

Follow these steps for a VM install:

1. Download the [Mininet VM image](https://github.com/mininet/mininet/downloads/) . This will take some time. It's ~800MB-1GB, compressed.

2. Download and install a virtualization system. We recommend [VirtualBox](http://www.virtualbox.org/wiki/Downloads) (free, GPL) because it is **free** and works on OS X, Windows, and Linux (though it's slightly slower than VMware in our tests.) You can also use [Qemu](http://qemu.org) for any platform, [VMware Workstation](http://www.vmware.com/products/workstation/) for Windows or Linux, or [VMware Fusion](http://www.vmware.com/products/fusion) for Mac, [KVM](http://www.linux-kvm.org) (free, GPL) for Linux.

3. Sign up for the `mininet-discuss` mailing list at https://mailman.stanford.edu/mailman/listinfo/mininet-discuss. This is the source for Mininet **support** and discussion with the friendly Mininet community. ;-)

4. Run through the [VM Setup Notes](/vm-setup-notes) to log in to the VM and install Mininet code on it.

5. Follow the [Walkthrough](/walkthrough) to get familiar with Mininet commands and typical usage.

Once you've completed the [Walkthrough](/walkthrough), you should have a clear idea for what Mininet is and what you might use it for. If you are interested in OpenFlow and Software-Defined Networking, you will want to complete the [OpenFlow tutorial](http://www.openflow.org/wk/index.php/OpenFlow_Tutorial) as well. Good luck, and have fun!


Option 2 on Ubuntu 12.10 and later: Mininet Package Upgrade
----------------------------------------------------------------

First, if you have upgraded from an earlier installation of Ubuntu and/or Mininet, make sure you *remove all traces of earlier versions of Open vSwitch from `/usr/local`*:

    sudo rm /usr/local/bin/ovs*
    sudo rm /usr/local/sbin/ovs*

Next, install the Mininet package:

    sudo apt-get install mininet

Then you can test it:

    sudo mn --test pingall

If that works, continue with steps 3-5, above.

Option 3 on *Ubuntu 11.10 and later*: Full Mininet installation
------------------------------------------------------
This option works well for local VM, remote EC2, and native installs.  It assumes the starting point of a fresh Ubuntu install. 

To find out which version of Ubuntu you are running, run the command

    lsb_release -a

To install natively on Ubuntu 11.10+ the basic technique is:

    git clone git://github.com/mininet/mininet
    mininet/util/install.sh -a

This takes about 5 minutes and will install everything that is included in the Mininet VM, including dependencies like Open vSwitch as well the additions like the OpenFlow wireshark dissector and POX.

Alternately, it may be possible to install a "minimal" configuration using

    mininet/util/install.sh -nv

This will install the reference OpenFlow switch and controller, Mininet and its dependencies, and Open vSwitch.

Next, test the basic Mininet functionality:

    sudo mn --test pingall

Then continue with steps 3-5, above, and if you encounter an error during installation, request help on [mininet-discuss](https://mailman.stanford.edu/mailman/listinfo/mininet-discuss).

(old) Mininet 1.0 Installation
------------------------------

You can choose to use an old VM from the [Mininet downloads](https://github.com/mininet/mininet/downloads/).

Or, use the archived `install-precise` branch of Mininet 1.0 for install on Ubuntu 12.04:

    git clone git://github.com/mininet/mininet
    cd mininet
    git fetch
    git checkout -b install-precise origin/devel/install-precise
    util/install.sh -a

Make sure you are installing from the *install-precise* branch.

