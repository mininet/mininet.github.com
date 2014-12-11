---
layout: post
title: "Announcing Mininet 2.2.0 !"
date: 2014-12-09 14:35
comments: true
categories: mininet releases
---
We are pleased to announce Mininet 2.2.0! This release  provides
a number of bug fixes as well as several new features, including:

* Improved OpenFlow 1.3 support

  - `mn --switch ovs,protocols=openflow13` starts OVS in 1.3 mode
  - `install.sh -w` installs 1.3-compatible Wireshark dissector using
    Loxigen
    - `install.sh -y` installs the Ryu 1.3-compatible controller

* A new `nodelib.py` node library, and new `Node` types including
  `LinuxBridge`, `OVSBridge`, `LinuxRouter` (see `examples/`) and `NAT`<br>
  {% img /images/nodelib.png %}

  - `mn --nat` will also semi-automatically connect a Mininet network
    to your LAN using NAT, solving the "why can't I ping
    [Google](http://google.com)?" problem.

    **Warning**: By default this will reroute local
    traffic originating at your Mininet server or VM and destined to
    the IP address
    range of your Mininet network (`10.0.0.0/8` by default) to the
    Mininet network, which can break connectivity if you are using
    addresses in the same range in your LAN. You can change this range
    using the `--ipbase` option.

* An improved MiniEdit GUI (`examples/miniedit.py`) - thanks to
  Gregory Gee <br>
  {% img /images/miniedit.png %}

* Support for multiple `--custom` arguments to `mn`

  `mn --custom mytopo.py,myswitch.py --topo mytopo --switch myswitch`

* Experimental cluster support - consult the
  [documentation](http://docs.mininet.org) for details -
  as well as `examples/cluster.py` and an experimental `--cluster`
  option for topologies built with the default `Host` and `OVSSwitch`
  classes:

  `mn --cluster localhost,server1,server2,server3 --topo tree,4,4`

  {% img /images/cluster.png %}

Note that examples contain experimental features which might
"graduate" into mainline Mininet in the future, but they should
not be considered a stable part of the Mininet API!

### How to get it

The easiest way to get started with Mininet is to download a
VM image. See [http://mininet.org/download](http://mininet.org/download)
for details.

The latest Mininet source code is available on
[github]([http://github.com/mininet/mininet) and also via
[code.mininet.org](http://code.mininet.org).

Additional information on the Mininet 2.2.0 release may be found in the
[release notes](http://wiki.mininet.org/Mininet-2.2.0-Release-Notes)
and on [docs.mininet.org](http://docs.mininet.org).

Mininet is an open source project, and we are grateful to our many
code contributors, bug reporters, and active users who continue to
help make Mininet a useful system with a friendly and helpful
community!

Have fun with Mininet!

**Mininet 2.2.0 Core Team:** <br>
Bob Lantz, Brian O'Connor, Cody Burkard <br>
Open Networking Laboratory
