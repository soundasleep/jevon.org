---
layout: page
title:  "Setting up a Bluetooth Wireless Network"
author: jevon
date:   2009-08-20 21:33:31 +1200
---

[[Articles]]

==Situation==
I connect to the Internet via a separate router box over the Local Area Network. I have two computers; one desktop which is always connected to the LAN, and a laptop which intermittently connects to the LAN. Our LAN has fixed IP addresses in the 192.168 range, for means of tracking users.

==Problem==
I wanted to set up a wireless network via [[Bluetooth]], so I could browse the Internet/LAN on my Laptop while it was disconnected from the rest of the network.

I couldn't get this to work with the built-in Bluetooth support of Windows XP SP1/SP2. The problem was that Windows would present the Bluetooth network as a "Personal Area Network", which could not be network bridged with my existing Local Area Connection. I could not share my Local Area Connection with Internet Connection Sharing; even if I wanted to, this would force an IP change, which was already being used. I also couldn't install the Bluetooth device on the server, because it is too far away.

==Solution==
Install the BlueSoieil Bluetooth software on both machines. Yes it's awful, but it will do.

Once installed on the server (in this case my desktop):
# Go '''View > Service Window'''
# Right click on "'''LAN Access'''" and enable it. This will open up a virtual COM port on your machine (in my case, COM11).
# Go into Network Connections; there should now be an "'''Incoming Connections'''" area. Right click on it and select '''Properties'''.
# Make sure the virtual COM port is enabled.
# Go to Users and select the Users that you want to give access.
# Go to the Networking tab, select TCP/IP, select Properties, and specify TCP/IP addresses that are equivalent of your network settings.
# What we are doing is creating a virtual dial-in connection. The client will connect to the server and be assigned an IP address from this range, appearing as a new client in the network with the new IP address.

Go to the Client software (in my case, the laptop)...
# Click the big red circle to find the devices in your Bluetooth network
# Find your server machine, double click it to automatically discover its services
# Once refreshed, click it, and then click the LAN Access button above.
# Fill in your username and password and click connect.
# You should now be able to connect via the magic of Bluetooth.

Some extra notes...
# I had to set up custom DNS settings on the client machine so that DNS would work - it looks like DNS settings are not automatically passed along on the wireless connection. I simply used the same DNS settings (and gateway, if you allow the client to specify its IP address) as the server machine.
# I purchased three "billionton Class 1" bluetooth USB adapters for cheap; however it looks like they are all illegal copies, and all have the same network address ('''00:11:f6:00:00:06'''). Luckily I had an extra adapter lying around, which I used for the server; in theory, this will allow multiple identical devices to connect only to the server.

[[Category:Technology]]