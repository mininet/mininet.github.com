---
layout: page
title: "Mininet Overview"
date: 2012-09-10 19:06
comments: true
sharing: true
footer: true
---
Mininet supports research, development, learning, prototyping, testing, debugging, and any other tasks that could benefit from having a complete experimental network on a laptop or other PC.

Mininet:
   * provides a simple and inexpensive **network testbed** for developing OpenFlow applications
   * enables **multiple concurrent developers** to work independently on the same topology
   * supports **system-level regression tests**, which are repeatable and easily packaged
   * enables **complex topology testing**, without the need to wire up a physical network
   * includes a **CLI** that is topology-aware and OpenFlow-aware, for debugging or running network-wide tests
   * supports **arbitrary custom topologies**, and includes a basic set of **parametrized topologies**
   * is **usable out of the box** without programming
   * also provides a straightforward and extensible **Python API** for network creation and experimentation
 
Mininet provides an easy way to get correct system _behavior_ and experiment with topologies.

The code you develop and test on Mininet, for an OpenFlow controller, modified switch, or host, _can move to a real system with no changes_, for real-world testing, performance evaluation, and deployment.


How it Works
-------------

Nearly every operating system virtualizes computing resources using a _process_ abstraction. Mininet uses _process-based virtualization_ to run many (we've successfully booted up to 4096) hosts and switches on a single OS kernel. Since version 2.2.26, Linux has supported _network namespaces_, a lightweight virtualization feature that provides individual processes with separate network interfaces, routing tables, and ARP tables. The full _Linux container architecture_ adds `chroot()` jails, process and user namespaces, and CPU  and memory limits to provide full OS-level virtualization, but Mininet does not require these additional features. Mininet can create kernel or user-space OpenFlow switches, controllers to control the switches, and hosts to communicate over the simulated network. Mininet connects switches and hosts using virtual ethernet (=veth=) pairs. While Mininet currently depends on the Linux kernel, in the future it may support other operating systems with process-based virtualization, such Solaris containers or !FreeBSD jails.

Mininet's code is almost entirely Python, except for a short C utility.


Why it's better
----------------

Compared to full system virtualization based approaches, such as OpenFlowVMS or the Noxrepo.org VM environment, Mininet:
* **boots faster**: seconds instead of minutes
* **scales larger**: hundreds of hosts and switches vs. single digits
* **provides more bandwidth**: typically 2Gbps total bandwidth on modest hardware
* **installs easily**: a prepackaged VM is available that runs on VMware or !VirtualBox for [Mac/Win/Linux](Mac/Win/Linux) with OpenFlow v1.0 tools already installed.

The down side is that Mininet cannot run non-Linux-compatible OpenFlow switches or applications; this has not been a major issue in practice.


Limitations
------------

Mininet _does not (yet) provide performance fidelity_, since resources are time-multiplexed by the kernel, and since overall bandwidth is limited by CPU and memory constraints. We expect to provide improved isolation and performance fidelity in the future.
