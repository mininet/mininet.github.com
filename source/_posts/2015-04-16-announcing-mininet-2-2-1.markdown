---
layout: post
title: "Announcing Mininet 2.2.1"
date: 2015-04-16 18:03
comments: true
categories:
---

Mininet 2.2.1 is primarily a performance improvement and bug fix release.

- **Batch startup** has been implemented for Open vSwitch, improving
  startup performance.

- **OVS patch links** have been implemented via OVSLink and `--link ovs`

  Warning! These links have *serious limitations* compared to
  virtual Ethernet pairs: they are not attached to real Linux
  interfaces so you cannot use `tcpdump` or `wireshark` with them;
  they also cannot be used in long chains - we don't recommend more
  than 64 OVSLinks, for example `--linear,64`. However, they can offer
  significantly better performance than veth pairs, for certain
  configurations.

Also:

- You can now easily **install Mininet on a [Raspberry Pi](http://raspberrypi.org)**
  (simply by using `install.sh -fnv` or `install.sh -a`)  ;-)

- `mn` now accepts multiple `--controller` arguments

- `--controller remote` and `RemoteController` now accept `ip` arguments
  of the form `<IP address>:<port>` (in addition to `ip=<IP>,port=<port>`)

Additional information for this release and previous releases
may be found in the **[Release Notes](https://github.com/mininet/mininet/wiki/Documentation#mininet-release-notes)**
on [docs.mininet.org](http://docs.mininet.org).

The easiest way to get started with Mininet is to download a
**[VM image](http://mininet.org/download)**. 

Download, installation, and upgrade instructions may be found at
<http://mininet.org/download> .

The latest Mininet **[source code](http://code.mininet.org)** is available on
[github]([http://github.com/mininet/mininet) and also via
[code.mininet.org](http://code.mininet.org).

Thanks to all of the Mininet contributors! A number of interesting features
and improvements are already in the works for Mininet 2.3.

