---
layout: post
title: "Mininet VM Security Advisory"
date: 2017-03-21 16:29
comments: true
categories: security mininet
---
Unfortunately, installing the Ubuntu SSH package into a VM image causes default SSH keys to be generated. In the case of the Mininet VM, this means that the VM images for Mininet 2.2.1 and earlier included the same set of default SSH keys (which could leave you open to a MITM attack.) This probably isn't surprising to many of you, but we're changing it in the Mininet VM images to avoid this issue.

As of Mininet 2.2.2, we no longer ship default SSH keys in the provided Mininet VM; we remove them before upload, and new SSH keys should be generated the first time you boot a Mininet 2.2.2 VM image.

If you are logging into an older Mininet VM over the internet or another non-secure network, we highly recommend regenerating your SSH keys if you haven't done so already:

```
sudo rm -f /etc/ssh/*key*
sudo /usr/sbin/dpkg-reconfigure openssh-server
sudo service ssh restart
```

Alternately, you are welcome to download a new Mininet 2.2.2 VM image.

If you're distributing a VM image for any purpose, we recommend removing any SSH keys before uploading it!

Additional information on Mininet 2.2.2 may be found at
[http://mininet.org/blog/2017/03/17/announcing-mininet-2-2-2/](http://mininet.org/blog/2017/03/17/announcing-mininet-2-2-2/)