---
layout: page
title: "Download/Get Started with Mininet"
comments: false
sharing: false
footer: true
---
The easiest way to get started is to **download a pre-packaged Mininet/Ubuntu VM**. This VM includes Mininet itself, all OpenFlow binaries and tools pre-installed, and tweaks to the kernel configuration to support larger Mininet networks.

*(These instructions are for Mininet 2.1.0 - for earlier versions, go to the bottom of this page.)*

Option 1: Mininet VM Installation (recommended)
-----------------------------------------------

VM installation is the **easiest and most foolproof** way of installing Mininet, so it's what we recommend to start with.

Follow these steps for a VM install:

1. Download the Mininet VM image ([2.1.0](https://bitbucket.org/mininet/mininet-vm-images/downloads) or [2.0.0](https://github.com/mininet/mininet/downloads/). This will take some time (it's ~800MB compressed.)

2. Download and install a virtualization system. We recommend [VirtualBox](http://www.virtualbox.org/wiki/Downloads) (free, GPL) because it is **free** and works on OS X, Windows, and Linux (though it's slightly slower than VMware in our tests.) You can also use [Qemu](http://qemu.org) for any platform, [VMware Workstation](http://www.vmware.com/products/workstation/) for Windows or Linux, [VMware Fusion](http://www.vmware.com/products/fusion) for Mac, or [KVM](http://www.linux-kvm.org) (free, GPL) for Linux.

3. Sign up for the [mininet-discuss mailing list](https://mailman.stanford.edu/mailman/listinfo/mininet-discuss). This is the source for Mininet **support** and discussion with the friendly Mininet community. ;-)

4. Run through the [VM Setup Notes](/vm-setup-notes) to log in to the VM and customize it as desired.

5. Follow the [Walkthrough](/walkthrough) to get familiar with Mininet commands and typical usage.

(In addition to the above resources, we've prepared a helpful Mininet [FAQ](/faq) as well as [Documentation](/docs) which you can refer to at any time!)

Once you've completed the [Walkthrough](/walkthrough), you should have a clear idea for what Mininet is and what you might use it for. If you are interested in OpenFlow and Software-Defined Networking, you will want to complete the [OpenFlow tutorial](http://www.openflow.org/wk/index.php/OpenFlow_Tutorial) as well. Good luck, and have fun!


Option 2: Native Installation from Source
-----------------------------------------

This option works well for local VM, remote EC2, and native installation.  It assumes the starting point of a fresh Ubuntu (or, experimentally, Fedora) installation. (*If you are upgrading from an older Mininet and/or OVS, see notes on removing old versions, below*.)

We strongly recommend more recent Ubuntu releases, because they support newer versions of Open vSwitch. (Fedora also supports recent OVS releases)

To find out which OS version you are running, run the command

    lsb_release -a

To install natively from source, the basic technique is:

    git clone git://github.com/mininet/mininet
    mininet/util/install.sh -a

This takes about 5 minutes and will install everything that is included in the Mininet VM, including dependencies like Open vSwitch as well the additions like the OpenFlow wireshark dissector and POX.

Alternately, it may be possible to install a "minimal" configuration using

    mininet/util/install.sh -fnv

This will install the reference OpenFlow switch and controller, Mininet and its dependencies, and Open vSwitch.

Next, test the basic Mininet functionality:

    sudo mn --test pingall

Then continue with steps 3-5, above, and if you encounter an error during installation that is not covered in the [FAQ](/faq) or [Documentation](/docs), and that you cannot solve on your own (or with help from Google :) ), you can request help on the friendly [mininet-discuss](https://mailman.stanford.edu/mailman/listinfo/mininet-discuss) mailing list.


Option 3: Installation from Packages
------------------------------------

If you're running a recent Ubuntu release, you can install the Mininet packages.
Note that this may give you an older version of Mininet, but it can be a very
convenient way to get started.

First, if you are upgrading or have upgraded from an earlier installation of Ubuntu and/or Mininet, make sure you *remove all traces of earlier versions of Mininet and Open vSwitch from `/usr/local/`*:

    sudo rm -rf /usr/local/bin/mn /usr/local/bin/mnexec \
        /usr/local/lib/python*/*/*mininet* \
        /usr/local/bin/ovs-* /usr/local/sbin/ovs-*

Next, install the base Mininet package by entering **only one** of the following commands, corresponding to the distribution you are running:

    Mininet 2.1.0 on Ubuntu 13.10: sudo apt-get install mininet
    Mininet 2.0.0 on Ubuntu 13.04: sudo apt-get install mininet
    Mininet 2.0.0 on Ubuntu 12.10: sudo apt-get install mininet/quantal-backports
    Mininet 2.0.0 on Ubuntu 12.04: sudo apt-get install mininet/precise-backports

(Note: Ubuntu 12.10 also has a Mininet 2.0.0d3 package, but you will want to install the one from quantal-backports, which is Mininet 2.0.0.)

After this completes, you should deactivate `openvswitch-controller` if it is running:

    sudo service openvswitch-controller stop
    sudo update-rc.d openvswitch-controller disable

Then you can test Mininet:

    sudo mn --test pingall

If Mininet complains that Open vSwitch isn't working, you may need to rebuild its kernel module:

    sudo dpkg-reconfigure openvswitch-datapath-dkms
    sudo service openflow-switch restart

If you wish to go through the Mininet walkthrough, you will want to install additional software. The following commands

    git clone git://github.com/mininet/mininet
    mininet/util/install.sh -fw

will install the OpenFlow reference switch, reference controller and Wireshark dissector.


(old) Mininet 1.0 Installation
------------------------------

You can choose to use an old VM from the [Mininet downloads](https://github.com/mininet/mininet/downloads/).

Or, use the archived `install-precise` branch to install Mininet 1.0 on Ubuntu 12.04:

    git clone git://github.com/mininet/mininet
    cd mininet
    git fetch
    git checkout -b install-precise origin/devel/install-precise
    util/install.sh -a

Make sure you are installing from the *install-precise* branch.

