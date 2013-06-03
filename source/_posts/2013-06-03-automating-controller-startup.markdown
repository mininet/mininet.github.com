---
layout: post
title: "Automating Controller Startup"
date: 2013-06-03 15:50
comments: false
categories: howto
---

One of Mininet's key features is that it makes it very easy to create
a complete virtual network including hosts, switches, links and
OpenFlow controllers. By default, Mininet runs Open vSwitch
in OpenFlow mode, which requires an OpenFlow controller.

As you probably know, Mininet comes with built-in Controller() classes to
support several controllers, including the OpenFlow reference controller
(`controller`), Open vSwitch's  `ovs-controller`,
and the now-deprecated NOX Classic.

You can easily choose which one you want when you invoke the `mn` command:

    $ sudo mn --controller ref
    $ sudo mn --controller ovsc
    $ sudo mn --controller NOX,pyswitch

Each of the above examples uses a controller which turns your OVS switches
into Ethernet bridges (aka learning switches.)

Note that `ovsc` is easy to install but only supports 16 switches.
You can install the reference controller (patched to support many switches)
using `install.sh -f`. (As of this writing, you can also install NOX
Classic using `install.sh -x`.)

## The manual way: using remote controllers

But what do you do if you want another controller like POX? Well, one
way is to start up POX (or Beacon, Floodlight, etc.) in another terminal
window and then use `--controller remote`:

    $ sudo mn --controller remote,ip=127.0.0.1

If your controller is running locally, you can just use

    $ sudo mn --controller remote

You might be asking: is there a way for Mininet to automatically start
up my controller so that I don't have to do it manually? The answer is,
of course, yes!

## The automatic way #1: using the command line

The latest Mininet `master` branch allows you to change the command and
arguments for `--controller ref` to invoke another controller as
desired. For example, here's how you could invoke POX:

    sudo mn --controller ref,command='python pox.py',cdir=$HOME/pox,cargs='openflow.of_01 --port=%s forwarding.l2_learning'

Note the following options:

`cdir`: the directory to change to before invoking the controller

`command`: the command to start your controller

`cargs`: the controller's arguments (including `%s` for wherever the controller's listening port should go)

## The super automatic way #2: creating a custom `Controller()` subclass

This is much easier than it sounds, and it has worked in Mininet since
version 1.0!

Here is a custom class for POX's l2_learning:

```python
from mininet.node import Controller
from os import environ

POXDIR = environ[ 'HOME' ] + '/pox'

class POX( Controller ):
    def __init__( self, name, cdir=POXDIR,
                  command='python pox.py',
                  cargs=( 'openflow.of_01 --port=%s '
                          'forwarding.l2_learning' ),
                  **kwargs ):
        Controller.__init__( self, name, cdir=cdir,
                             command=command,
                             cargs=cargs, **kwargs )

controllers={ 'pox': POX }
```

With this class saved into `pox.py`, you can now do the following:

   sudo mn --custom pox.py --controller pox

Additionally you can use the custom class in your Mininet scripts

```python
#!/usr/bin/python

from mininet.log import setLogLevel
from mininet.net import Mininet
from mininet.topolib import TreeTopo
from mininet.cli import CLI

# We assume you are in the same directory as pox.py
# or that it is loadable via PYTHONPATH
from pox import POX

setLogLevel( 'info' )

net = Mininet( topo=TreeTopo( depth=2, fanout=2 ),
               controller=POX )

net.start()
CLI( net )
net.stop()
```

Note that in this custom class we've simply changed
`__init__`, but in a more complicated example you might
wish to change the `start()` and `stop()` methods as
well.

