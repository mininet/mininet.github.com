---
layout: post
title: "Announcing Mininet 2.0.0"
date: 2012-11-27 17:41
comments: true
categories: releases
published: false
---

We are pleased to announce the availability of [Mininet 2.0.0](/download)!

In the last few years, the Mininet community has grown from a few users at Stanford to an active mailing list with over 500 members in academia, startups, and industry.

Version 2 (“HiFi”) is a major upgrade that expands Mininet's scope from functional testing (“does my network control plane work?”) to performance testing (“how well does my custom congestion control perform with 10 Mb/s links?”).  New APIs now allow you to create links with specified bandwidths, latencies and loss rates, and to limit the CPU usage of virtual hosts. Using these new features, 37 students in Stanford University’s Advanced Topics in Networking course (CS244) replicated 16 published research experiments; you’re encouraged to browse their stories at [The Reproducing Network Research Blog](http://reproducingnetworkresearch.wordpress.com/).

Other new features of Mininet 2.0.0 include:

*  An all-new website, <http://mininet.github.com>, with [online doxypy documentation](/api) for all classes.
*  More flexible mn command line options, including the ability to specify NOX (and, in the future, POX) modules from the `mn` command line, and the ability to set link and CPU bandwidth limits
*  Dynamic link reconnection in OVS (supports migration and mobility emulation)
*  First-class abstractions/classes for link (`Link`) and interface (`Intf`) objects
*  Interface/link bandwidth limiting support using `tc`, via `TCIntf` and `TCLink` classes
*  CPU bandwidth limiting supporting both CFS bandwidth limiting and POSIX real-time scheduling, via the CPULimitedHost class
*  Easier task execution on virtual hosts via the `Host.Popen()` interface, implemented in `mnexec` using the `setns` system call
*  Easier and faster native installations that can use the latest Open vSwitch packages.

Note that the `Topo` object has changed somewhat to enable more flexible topology params, and as a result, your old code may need a few changes.

Download and installation instructions are available at <http://mininet.github.com/download> and Mininet source code may be found at <https://github.com/mininet/mininet>. We welcome new feature implementations, bug fixes, bug reports, FAQ additions and other contributions, and we look forward to high-quality discussions on [`mininet-discuss`](https://mailman.stanford.edu/mailman/listinfo/mininet-discuss).

Thanks to all the code contributors, bug reporters, and active users who helped make this release possible!

The Mininet Team

*  Bob Lantz
*  Brandon Heller
*  Nikhil Handigol
*  Vimalkumar Jeyakumar
