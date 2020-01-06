---
layout: post
title:  "Setting up NF4V as an access point"
date:   2020-01-06 23:27:00 +1200
categories: 
  - networking
---

I had some difficulty setting up a spare Netcomm NF4V router as an access point extending an existing wireless network, 
but I think I got it to work.

I learned heaps from [Using an Old Router to Extend your Wifi](https://www.geekzone.co.nz/forums.asp?forumid=66&topicid=239735).

The overall architecture, with each connection being a physical ethernet cable:

```
[ Fibre box ] <----> [ Primary wifi router ] <----> [ Switch ] <----> [ NF4V router ] <----> additional clients
```

The overall process was roughly (assuming you know how to `ping`, and the basics of IPv4/subnets/DHCP):

1. Reset the router. Connect to it via ethernet or wireless using the default credentials. Don't connect any of the ethernet ports yet.
2. Change the admin password, wireless network name, wireless password. Set it to something different to help with debugging.
3. Give the router a separate LAN address for admin in Advanced Setup > LAN. For example, if you had a network `192.168.0.x`,
   and your main router was `192.168.0.1`:

       IP address:  192.168.0.2     (something different from your primary router)
       Subnet mask: 255.255.255.0   (same as other devices)
       DHCP server: Enabled, but with a different range to your primary DHCP server
    
   The other settings don't matter. (It helps to have ICMP snooping enabled, so you can `ping` all the devices in the network.)
3. Configure your primary router to have a DHCP range that is different to the NF4V router.
4. Verify you can still access the NH4V admin page through wifi/ethernet, by setting a IPv4 address manually, e.g.:

       IP address:  192.168.0.100   (something different again)
       Subnet mask: 255.255.255.0   (as above)
       Router:      192.168.0.2     (your NF4V router IP)

5. You should now be able to:
   - Ping the NF4V router from your device
   - NOT ping anything else
6. Connect the NF4V router, using a normal ethernet cable, from LAN port 1 (called `eth0` by NF4V) into your main router.
7. You should now be able to:
   - Ping the NF4V router
   - Ping the primary router from the NF4V router, and access its admin page
   - Ping the NF4V router from the primary router, and access its admin page
   - Ping other devices on your network
   - NOT be able to ping the outside world
8. You're still connected with a manual IPv4 address. Turn that off, and reconnect. You should be served a new IP with DHCP (likely from the NH4V).
9. You should now be able to:
   - Ping the NF4V router
   - Ping the primary router from the NF4V router, and access its admin page
   - Ping the NF4V router from the primary router, and access its admin page
   - Ping other devices on your network
   - Ping the outside world
10. The final step is to change the NF4V wifi network name/SSID to be the same as your primary wifi network name/SSID.

### What about setting up an ETH WAN connection using IP over Ethernet (IPoE)?

In theory, this might work, but I couldn't get it to work. I got as far as getting valid routes on the NF4V
(e.g. `0.0.0.0/8` to route through to the `192.168.0.1`), but I couldn't get the wifi network to route through eth0,
and it [wasn't a recommended solution by others](https://www.geekzone.co.nz/forums.asp?forumid=66&topicid=239735&page_no=1#2066409).

It's also not possible to set up 0.0.0.0/8 as a static route in the NF4V, as it complains that it's not a valid address.
