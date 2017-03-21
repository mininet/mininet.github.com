---
layout: post
title: "Announcing Mininet 2.2.2"
date: 2017-03-17 00:48
comments: true
categories:
---

Mininet 2.2.2 is primarily a performance improvement and bug fix release.

### Security Advisory!

* The Mininet VM images no longer ship with identical `ssh` keys. We recommend that you
  destroy any default `ssh` keys in existing Mininet VMs if you haven't already:

```
sudo rm -f /etc/ssh/*key*
sudo /usr/sbin/dpkg-reconfigure openssh-server
sudo service sshd restart
```

### Improvements and Bug Fixes

* We now run [public CI builds via Travis](/blog/2017/01/12/testing-using-travis-ci/)
* Several common test failures have been addressed
* We use our own forked versions of `oflops` and the Stanford Reference
  Switch/Controller
* `install.sh` now has basic support for RHEL
* `mnexec` now works on systemd systems
* The default OpenFlow port is now the official port of 6653 rather
  than the classic port of 6633, which was nastily co-opted by Cisco.
* Several issues with the NAT element have been addressed

### Bugs and Gotchas

* Ubuntu 16.04 LTS (Xenial) kernel bug: the problem resulting
  in `unregister_netdevice: waiting for lo to become free. Usage count
  = 1` in the console or kernel log has returned. We recommend using 14.04
  or an older kernel until this is fixed.
* Ryu installation with `install.sh -y` is still broken
* The `--tests` option is slightly different from mainline

### Release notes and Downloads

Full release notes for this release and previous releases
may be found in the **[Release Notes](https://github.com/mininet/mininet/wiki/Documentation#mininet-release-notes)**
on [docs.mininet.org](http://docs.mininet.org).

The easiest way to get started with Mininet is to download a
**[VM image](http://mininet.org/download)**.

Download, installation, and upgrade instructions may be found at
<http://mininet.org/download> .

The latest Mininet **[source code](http://code.mininet.org)** is available on
[github]([http://github.com/mininet/mininet) and also via
[code.mininet.org](http://code.mininet.org).

### Acknowledgments

Thanks to all of the contributors of fixes and enhancements for this
release, including Olivier Tilmans, Jono Hart, Tomasz Buchert, Rahman
Pujianto, Roan Huang, M S Vishwanath Bhat, Brian O'Connor, and others.
