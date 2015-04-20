---
layout: page
title: "Download/Get Started with Mininet"
comments: false
sharing: false
footer: true
---
The easiest way to get started is to **download a pre-packaged Mininet/Ubuntu VM**. This VM includes Mininet itself, all OpenFlow binaries and tools pre-installed, and tweaks to the kernel configuration to support larger Mininet networks.

<!--
*(These instructions are for Mininet 2.2.0 - for earlier versions, go to the bottom of this page.)*
-->

* kramdown will replace the following tag with a table of contents
{:toc}

Option 1: Mininet VM Installation (easy, recommended)
-----------------------------------------------

VM installation is the **easiest and most foolproof** way of installing Mininet, so it's what we recommend to start with.

Follow these steps for a VM install:

1. Download the [Mininet VM image](https://github.com/mininet/mininet/wiki/Mininet-VM-Images).

2. Download and install a virtualization system. We recommend [VirtualBox](http://www.virtualbox.org/wiki/Downloads) (free, GPL) because it is **free** and works on OS X, Windows, and Linux (though it's slightly slower than VMware in our tests.) You can also use [Qemu](http://qemu.org) for any platform, [VMware Workstation](http://www.vmware.com/products/workstation/) for Windows or Linux, [VMware Fusion](http://www.vmware.com/products/fusion) for Mac, or [KVM](http://www.linux-kvm.org) (free, GPL) for Linux.

3. Sign up for the [mininet-discuss mailing list](https://mailman.stanford.edu/mailman/listinfo/mininet-discuss). This is the source for Mininet **support** and discussion with the friendly Mininet community. ;-)

4. Run through the [VM Setup Notes](/vm-setup-notes) to log in to the VM and customize it as desired.

5. Follow the [Walkthrough](/walkthrough) to get familiar with Mininet commands and typical usage.

(In addition to the above resources, we've prepared a helpful Mininet [FAQ](/faq) as well as [Documentation](/docs) which you can refer to at any time!)

Once you've completed the [Walkthrough](/walkthrough), you should have a clear idea for what Mininet is and what you might use it for. If you are interested in OpenFlow and Software-Defined Networking, you will want to complete the [OpenFlow tutorial](https://github.com/mininet/openflow-tutorial/wiki) as well. Good luck, and have fun!


Option 2: Native Installation from Source
-----------------------------------------

This option works well for local VM, remote EC2, and native installation.  It assumes the starting point of a fresh Ubuntu (or, experimentally, Fedora) installation. (*If you are upgrading from an older Mininet and/or OVS, see notes on removing old versions, below*.)

We strongly recommend more recent Ubuntu releases, because they support newer versions of Open vSwitch. (Fedora also supports recent OVS releases)

To install natively from source, first you need to get the source code:

    git clone git://github.com/mininet/mininet

Note that the above `git` command will check out the latest and greatest Mininet
(which we recommend!) If you want to run the last tagged/released version of
Mininet - or any other version - you may check that version out explicitly:

    cd mininet
    git tag  # list available versions
    git checkout -b 2.2.1 2.2.1  # or whatever version you wish to install
    cd ..

Once you have the source tree, the command to install Mininet is:

    mininet/util/install.sh [options]

Typical `install.sh` options include:

* `-a`: install everything that is included in the Mininet VM, including dependencies like Open vSwitch as well the additions like the OpenFlow wireshark dissector and POX. By default these tools will be built in directories created in your home directory. <br>
* `-nfv`: install Mininet, the OpenFlow reference switch, and Open vSwitch <br>
* `-s mydir`: use this option before other options to place source/build trees in a specified directory rather than in your home directory.

So, you will probably wish to use one (and only one) of the following commands:

    To install everything (using your home directory): install.sh -a
    To install everything (using another directory for build): install.sh -s mydir -a
    To install Mininet + user switch + OVS (using your home dir): install.sh -nfv
    To install Mininet + user switch + OVS (using another dir:) install.sh -s mydir -nfv

You can find out about other useful options (e.g. installing the OpenFlow wireshark dissector, if it's not already included in your version of wireshark) using

    install.sh -h

After the installation has completed, test the basic Mininet functionality:

    sudo mn --test pingall

Then continue with steps 3-5, above. If you run into errors, first consult the [FAQ](/faq), [Documentation](/docs), and [mailing list archives](https://mailman.stanford.edu/pipermail/mininet-discuss/) to see if anything resembling your problem has been seen before and if there might be a possible solution. If those things don't help and you still have problems that you cannot solve on your own (or with some help from [Google](http://google.com) :) ), you can request help on the friendly [mininet-discuss](https://mailman.stanford.edu/mailman/listinfo/mininet-discuss) mailing list.


Option 3: Installation from Packages
------------------------------------

If you're running a recent Ubuntu release, you can install the Mininet packages.
Note that this may give you an older version of Mininet, but it can be a very
convenient way to get started.

First, if you are upgrading or have upgraded from an earlier installation of Mininet (like 1.0) or a version of Open vSwitch which might have been compiled and stored in `/usr/local`, make sure you *remove any traces of earlier versions of Mininet and Open vSwitch from `/usr/local/`*:

    sudo rm -rf /usr/local/bin/mn /usr/local/bin/mnexec \
        /usr/local/lib/python*/*/*mininet* \
        /usr/local/bin/ovs-* /usr/local/sbin/ovs-*

Then, to confirm which OS version you are running, run the command

    lsb_release -a

Next, install the base Mininet package by entering **only one** of the following commands, corresponding to the distribution you are running:

    Mininet 2.1.0 on Ubuntu 14.10: sudo apt-get install mininet
    Mininet 2.1.0 on Ubuntu 14.04: sudo apt-get install mininet
    Mininet 2.0.0 on Ubuntu 12.04: sudo apt-get install mininet/precise-backports

<!--
(Note: Ubuntu 12.10 also has a Mininet 2.0.0d3 package, but you will want to install the one from quantal-backports, which is Mininet 2.0.0.)
-->

After this completes, you should deactivate `openvswitch-controller` if it is installed and/or running:

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


Option 4. Upgrading an existing Mininet Installation
----------------------------------------------------

There are many ways to do this. If you haven't made any changes to
Mininet, you can usually

    cd mininet
    git fetch
    git checkout master
    sudo make install

As an alternative to `sudo make install` you can also do `sudo make develop`,
which will create symbolic links from `/usr/python/...` to your source tree.

Note that this will only upgrade Mininet itself - any other components such
as Open vSwitch, etc. can be upgraded separately as desired.

<!--

(old) Mininet 1.0 Installation
------------------------------

You may be able to find a *very* old VM image on the [Old Mininet downloads](https://github.com/mininet/mininet/downloads/),
page, though we don't really recommend using it.

You can also use the archived `install-precise` branch to install Mininet 1.0 on Ubuntu 12.04:

    git clone git://github.com/mininet/mininet
    cd mininet
    git fetch
    git checkout -b install-precise origin/devel/install-precise
    util/install.sh -a

Make sure you are installing from the *install-precise* branch.
-->
