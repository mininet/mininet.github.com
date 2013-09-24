---
layout: post
title: "Announcing Mininet 2.1.0 !"
date: 2013-09-20 13:59
comments: true
categories: 
---

We are pleased to announce the immediate availability of Mininet 2.1.0
on [mininet.org](http://mininet.org) !

[Mininet](http://mininet.org) is a network emulation platform that is intended
to be the quickest, easiest, and most enjoyable way to create virtual networks
for research, education, and system development.  By providing an instant
virtual network on your laptop that can run real application, switch, and
controller code, Mininet also makes it convenient to get started with SDN and
OpenFlow without any additional hardware.

Mininet 2.1.0 provides a number of bug fixes as well as
new features, including:

* Convenient access to `Mininet()` as a **dict of nodes**
* **X11 tunneling** (wireshark in Mininet hosts, finally!)
* Accurate reflection of the `Mininet()` object in the CLI
* Automatically detecting and adjusting resource limits
* **Automatic cleanup** on failure of the `mn` command
* Support for installing the **OpenFlow 1.3** versions of the reference
  user switch and NOX from CPqD
* Preliminary support for running **OVS in user space mode**
* Preliminary support (`IVSSwitch()`) for the **Indigo Virtual Switch**
* Preliminary support for **Fedora** in `install.sh`
* A script (`util/m`) for **easily running new shells or commands in nodes**
* The ability to **import modules from `mininet.examples`**

We have provided several new examples (which can easily be
imported to provide useful functionality) including:

* Modeling **separate control and data networks**: `mininet.examples.controlnet`
* Connecting **Mininet hosts to the internet** (or a LAN) using NAT: `mininet.examples.nat`
* Creating **per-host custom directories** using bind mounts: `mininet.examples.bind`

Note that examples contain experimental features which might
"graduate" into mainline Mininet in the future, but they should 
not be considered a stable part of the Mininet API!

Additional information may be found in the
[Release Notes](https://github.com/mininet/mininet/wiki/Mininet-2.1.0-Release-Notes).

Mininet is an open source project, and we are grateful to our many code
contributors, bug reporters, and active users who continue to help make Mininet
a useful system with a friendly and helpful community!

Have fun with Mininet!

**The Mininet 2.1.0 Team**<br>
Bob Lantz and Brian O'Connor<br>
Open Networking Laboratory


