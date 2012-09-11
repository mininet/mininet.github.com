---
layout: page
title: "Mininet Sample Workflow"
comments: false
sharing: true
footer: true
---
Mininet enables you to quickly [create](#create), [interact with](#interact), [customize](#customize) and [share](#share) a software defined network prototype, and provides a smooth path to [running on hardware](#run). This page illustrates the basic Mininet workflow, and many additional details are available in the Mininet [walkthrough](Walkthrough), the OpenFlow [tutorial](http://www.openflow.org/wk/index.php/OpenFlow_Tutorial), and Mininet [documentation](Documentation).


<a id=create></a>
### Creating a Network

You can create a network with a single command. For example,

    mn --switch ovsk --controller nox --topo tree,depth=2,fanout=8 --test pingall

starts a network with a tree topology of depth 2 and fanout 8 (i.e. 9 switches connecting 64 hosts), using Open vSwitch switches under the control of NOX (via its `pyswitch` module by default), and runs the `pingall` test to check connectivity between every pair of nodes.


<a id=interact></a>
### Interacting with a Network

Mininet's CLI allows you to control and manage your entire virtual network from a single console. For example, the CLI command

    mininet> h2 ping h3

tells host `h2` to ping host `h3`'s IP address.

<a id=customize></a>
### Customizing a Network

Mininet's API allows you to create custom networks with a few lines of Python. For example, the following script

{% codeblock lang:python %}

from mininet.net import Mininet
from mininet.topolib import TreeTopo
tree4 = TreeTopo(depth=2,fanout=2)
net = Mininet(topo=tree4)
net.start()
h1, h4  = net.hosts[0], net.hosts[3]
print h1.('ping -c1 %s' % h4.IP())
net.stop()

{% endcodeblock %}

creates a small network (4 hosts, 3 switches), and pings one host from another (in about 4 seconds with the current version.)

The Mininet distribution includes several text-based and graphical (see above) applications which we hope will be instructive and inspire you to create cool and useful apps for your own network designs.

<a id=share></a>
### Sharing a Network

Mininet is distributed as a virtual machine (VM) image with all dependencies pre-installed, runnable on common virtual machine monitors such as VMware, Xen and VirtualBox. This provides a convenient container for distribution; once a prototype has been developed, the VM image may be distributed to others to run, examine and modify. A complete, compressed Mininet VM is about 800 MB. (Mininet can also be installed natively on Linux distributions that ship with `CONFIG_NET_NS` enabled, such as Ubuntu 10.04+, without replacing the kernel.) If you are reading a great SIGCOMM (or other) paper about a Software-Defined Network, wouldn't you like to be able to click, download and run a living, breathing example of the system? If so, consider developing a Mininet version of your own system that you can share with others. (Alternately, if you fear others reproducing - and possibly contradicting - your published results, an easily shared and downloaded version of your system may not be desirable!)


<a id=run></a>
### Running on Hardware

Once a design works on Mininet, it can be deployed on hardware for real-world use, testing and measurement.

To successfully port to hardware on the first try, every Mininet-emulated component must act in the same way as its corresponding physical one. The virtual topology should match the physical one; virtual Ethernet pairs must be replaced by link-level Ethernet connectivity. Hosts emulated as processes should be replaced by hosts with their own OS image. In addition, each emulated OpenFlow switch should be replaced by a physical one configured to point to the controller. However, the controller does not need to change. When Mininet is running, the controller "sees" a physical network of switches, made possible by an interface with well-defined state semantics.
