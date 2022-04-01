---
layout: page
title: "Mininet Sample Workflow"
comments: false
sharing: true
footer: true
root: /
---
Mininet enables you to quickly [create](#create), [interact with](#interact), [customize](#customize) and [share](#share) a software defined network prototype, and provides a smooth path to [running on hardware](#run). This page illustrates the basic Mininet workflow, and many additional details are available in the Mininet [walkthrough](/walkthrough), the OpenFlow [tutorial](https://github.com/mininet/openflow-tutorial/wiki), and Mininet [documentation](https://github.com/mininet/mininet/wiki/Documentation).

<a id="create"></a>

### Creating a Network

You can create a network with a single command. For example,

    sudo mn --switch ovs --controller ref --topo tree,depth=2,fanout=8 --test pingall

starts a network with a tree topology of depth 2 and fanout 8 (i.e. 64 hosts connected to 9 switches), using Open vSwitch switches under the control of the OpenFlow/Stanford reference controller, and runs the `pingall` test to check connectivity between every pair of nodes. (This takes about
    45 seconds on my laptop.)

<a id="interact"></a>

### Interacting with a Network

Mininet's CLI allows you to control, and manage your entire virtual network from a single console. For example, the CLI command

    mininet> h2 ping h3

tells host `h2` to ping host `h3`'s IP address. *Any available Linux command or program can be run on any virtual host*. You can easily start a web server on one host and make an HTTP request from another:

    mininet> h2 python -m SimpleHTTPServer 80 >& /tmp/http.log &
    mininet> h3 wget -O - h2

<a id="customize"></a>

### Customizing a Network

Mininet's API allows you to create custom networks with a few lines of Python. For example, the following script

{% codeblock lang:python %}

from mininet.net import Mininet
from mininet.topolib import TreeTopo
tree4 = TreeTopo(depth=2,fanout=2)
net = Mininet(topo=tree4)
net.start()
h1, h4  = net.hosts[0], net.hosts[3]
print h1.cmd('ping -c1 %s' % h4.IP())
net.stop()

{% endcodeblock %}

creates a small network (4 hosts, 3 switches), and pings one host from another (in about 4 seconds with the current version.)

The Mininet distribution includes several text-based and graphical (see above) applications which we hope will be instructive and inspire you to create cool and useful apps for your own network designs.

<a id="share"></a>

### Sharing a Network

Mininet is distributed as a virtual machine (VM) image with all dependencies pre-installed, runnable on common virtual machine monitors such as VMware, Xen and VirtualBox. This provides a convenient container for distribution; once a prototype has been developed, the VM image may be distributed to others to run, examine and modify. A complete, compressed Mininet VM is about 1GB. (Mininet can also be installed natively - `apt-get install mininet` on Ubuntu.) If you are reading a great SIGCOMM (or other) paper about a Software-Defined Network, wouldn't you like to be able to click, download and run a living, breathing example of the system? If so, consider developing a Mininet version of your own system that you can share with others!

<!-- heheheh
(Alternately, if you fear others reproducing - and possibly contradicting - your published results, an easily shared and downloaded version of your system may not be desirable!)
-->


<a id="run"></a>

### Running on Hardware

Once a design works on Mininet, it can be deployed on hardware for real-world use, testing and measurement.

To successfully port to hardware on the first try, every Mininet-emulated component must act in the same way as its corresponding physical one. The virtual topology should match the physical one; virtual Ethernet pairs must be replaced by link-level Ethernet connectivity. Hosts emulated as processes should be replaced by hosts with their own OS image. In addition, each emulated OpenFlow switch should be replaced by a physical one configured to point to the controller. However, the controller does not need to change. When Mininet is running, the controller "sees" a physical network of switches, made possible by an interface with well-defined state semantics.
