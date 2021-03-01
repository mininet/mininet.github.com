---
layout: post
title: "Congrats to Mininet SIGCOMM Hackathon winners!"
date: 2018-08-27 15:39
comments: false
categories:
---
Congratulations to Alexander Jung, Michał Król and Torsten Runge, who
prototyped a Mininet node class for launching unikernels - small
application-specific kernel images, basically an application linked
with a library OS, ClickOS being one example - and ended up placing in
the SIGCOMM 2018 Hackathon!

[http://conferences.sigcomm.org/sigcomm/2018/hackathon.html](http://conferences.sigcomm.org/sigcomm/2018/hackathon.html)

In their case they used Rumprun as the unikernel system and qemu/kvm
to launch it:

- [http://github.com/nderjung/mininet](http://github.com/nderjung/mininet) (Branch: `devel/rump`)
- [http://github.com/rumpkernel/rumprun/](http://github.com/rumpkernel/rumprun/)
- [http://unikernel.org](http://unikernel.org)

They are planning on continuing to work on it, so I hope we can get something
simple and useful running and perhaps added to Mininet!
