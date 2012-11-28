---
layout: post
title: "Announcing Mininet 2.0.0"
date: 2012-11-27 17:41
comments: true
categories: releases
---

In the last few years, the Mininet community has grown from a few users at Stanford to an active mailing list with over 500 members in academia, startups, and industry.

Version 2 ("HiFi") is a major upgrade that expands Mininet's scope from functional testing ("does my design work?") to performance testing ("how fast is my design with 10 Mbps links?").  New APIs enable you to create links with different bandwidths, latencies and loss rates. You can also cap the amount of CPU time allocated to your virtual hosts.  Using these features, 37 students in Stanford University's Graduate Networking Course replicated 16 published research experiments; you're encouraged to browse their stories at [The Reproducing Network Research Blog](http://reproducingnetworkresearch.wordpress.com/).

Other new features of Mininet 2.0.0 include:
Native installations are easier, faster, and can use the latest Open vSwitch packages.

*  An all-new website, mininet.github.com, with online doxypy documentation for all classes.
*  More flexible mn command line options, including the ability to specify NOX (and, in the future, POX) modules from the mn command line, and the ability to set link and CPU bandwidth limits
*  Dynamic link reconnection in OVS (supports migration and mobility emulation)
*  First-class abstractions/classes for link (`Link`) and interface (`Intf`) objects
*  Interface/link bandwidth limiting support using `tc`, via `TCIntf` and `TCLink` classes
*  CPU bandwidth limiting supporting both CFS bandwidth limiting and POSIX real-time scheduling, via the CPULimitedHost class
*  Easier task execution on virtual hosts via the `Host.Popen()` interface, implemented in `mnexec` using the `setns` system call

Note that the `Topo` object has changed somewhat to enable more flexible topology params, and as a result, your old code may need a few changes.

Thanks to all the code contributors, bug reporters, and active users who helped make this release possible!

The Mininet Team

*  Bob Lantz
*  Brandon Heller
*  Nikhil Handigol
*  Vimalkumar Jeyakumar
