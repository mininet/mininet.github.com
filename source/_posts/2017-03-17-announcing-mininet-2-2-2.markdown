---
layout: post
title: "Announcing Mininet 2-2-2"
date: 2017-03-17 00:48
comments: true
categories:
---

[Pre-release! The 2.2.2 release is not yet final.]

Mininet 2.2.2 is primarily a performance improvement and bug fix release.

### Security Fix/Advisory

* The Mininet VM image no longer includes the same, identical `ssh`
  key for everyone, and should instead generate new ones the first
  time it is booted(!!) *[In my opinion, the `.ovf` spec should
  include an option (and the OS should include a mechanism) to
  regenerate SSH keys and MAC addresses, since the issue is likely to
  occur in any VM image with SSH installed!]*

* We recommend that you use the Mininet 2.2.2 or newer VM images.

### Ubuntu 16.04 LTS (Xenial) Compatibility

* **Kernel Bug Returns!** :( Unfortunately, the annoying kernel bug
    that causes `unshare()` to hang (and Mininet to stop working until
    you reboot) has returned. You may see a message like
    `unregister_netdevice: waiting for lo to become free. Usage count
    = 1` in the console or kernel log. Until this is fixed, we don't
    recommend using 16.04 (or the Linux 3.16 kernel.)

* We no longer attempt to delete a nonexistent root `qdisc` if one is
  not present (thanks to Olivier Tilmans)

* `xenial` VMs can now be created using `build.py`

### Ubuntu 15 (Utopic) Compatibility

* We support `openvswitch-testcontroller` in Ubuntu 15. Note this
  controller is deprecated and not present in Ubuntu 16.

### Code Check and Continuous Integration

* We now run public CI builds via Travis
* The builds include a code check using `pylint` on Ubuntu 14.04 LTS

### Notable Bug Fixes or Workarounds

* We've been seeing a variety of performance test failures running
  under kvm, so the constraints on some performance tests have been
  relaxed slightly.

* A race condition that could cause `Mininet.iperf()` to fail has been
  addressed. (#589)

* We have forked the Stanford OpenFlow 1.0 reference controller and
  `oflops` and use our own versions in the Mininet VM image. Note
  these are somewhat obsolete.

* `install.sh` has basic support for RHEL.

* `mnexec` explicitly recursively marks mounts as private; this should
  fix compatibility with `systemd` based systems which inexplicably
  require the default mount namespace behavior to be shared. ;-(
  (#565)

* The default OpenFlow port is now the official port of 6653 rather
  than the classic port of 6633, which was nastily co-opted by Cisco.

* NAT can use all interfaces.

* `ip_forward` is restored to its original state after NAT shuts down

* An option has been added to the `NAT` element, and `iptables` are
  not flushed by default.

* The NAT element now correctly attaches to the switch that is
  specified in its parameters.

* A number of tests have been revised to make them more reliable.

### Bugs and gotchas

* Ryu installation with `install.sh -y` is still broken

* The `--tests` option is slightly different from mainline, accepting
  multiple test names rather than parameters for the test. Please do
  not depend on this functionality in 2.2.2, or update to mainline if
  you require the new functionality.

* As noted, Ubuntu 16.04+/Linux 4.4 includes a kernel regression which
  breaks container systems with the `waiting for lo to become free`
  error. Until this is fixed, we don't recommend those OS/kernel
  versions.  If you run into the problem, Mininet will stop working
  until you reboot.

### Acknowledgments

Thanks to all of the contributors of fixes and enhancements for this
release, including Olivier Tilmans, Jono Hart, Tomasz Buchert, Rahman
Pujianto, Roan Huang, M S Vishwanath Bhat, Brian O'Connor, and others.

Updated release notes may be found at:
https://github.com/mininet/mininet/wiki/Mininet-2.2.2-Release-Notes
