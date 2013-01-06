---
layout: page
title:  "IPv6"
author: jevon
date:   2012-06-24 04:39:32 +1200
---

==Setting up IPv6 on a [[Linode]] node==

# Make sure that you are in an IPv6 native datacenter.
# Add your IPv6 address as AAAA records in your DNS server, for `www`/`@`/`*` subdomains.
# Ensure that when you execute `ifconfig`, <a href="https://library.linode.com/networking/ipv6">your IPv6 address is displayed</a> as a `Scope:Global` address for `eth0`:
<code>
eth0      Link encap:Ethernet  HWaddr f2:3c:91:df:00:00
          inet addr:50.1.2.3.4  Bcast:50.1.2.255  Mask:255.255.255.0
          inet6 addr: 2600:1234::1234:91ff:1234:1234/64 Scope:Global
          inet6 addr: fe80::1234:1234:fedf:ed78/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:8230 errors:0 dropped:0 overruns:0 frame:0
</code>
# If not, you will need to add it using `ifconfig eth0 inet6 add 2600:1234::1234:91ff:1234:1234/64`.
# Check that you can ping IPv6 using `ping6 ipv6.google.com`.
# If you get a _connect: Network is unreachable_ error, make sure that your IPv6 firewall <a href="http://forums.gentoo.org/viewtopic-t-873409.html">does not block _any_ ICMP</a>.
<code>
-A INPUT -p ipv6-icmp -j ACCEPT
</code>
# Make sure that Apache is listening to all interfaces on port 80, or <a href="http://httpd.apache.org/docs/2.0/bind.html">add the IPv6 address as a specific `Listen` directive</a>.
# Restart Apache (`service apache2 restart`) to allow Apache to rebind to the new interface.

==Test IPv6 server connectivity==
Two sites that I used:

# http://www.mrp.net/cgi-bin/ipv6-status.cgi?domain=jevon.org
# http://ipv6-test.com/validate.php

[[Category:Sysadmin]]
[[Category:Linux]]
[[Category:Networking]]
[[Category:Troubleshooting]]