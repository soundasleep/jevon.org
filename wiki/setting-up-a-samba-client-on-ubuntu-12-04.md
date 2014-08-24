---
layout: page
title:  "Setting up a Samba client on Ubuntu 12.04"
author: jevon
date:   2014-08-24 19:38:01 +1200
---

[[Linux]] / [[Ubuntu]] / [[Samba]]

Based on <a href="https://help.ubuntu.com/community/MountWindowsSharesPermanently">MountWindowsSharesPermanently</a>, for [[Ubuntu]] after 12.04:

1. Create a share on your Windows machine (the remote share)

2. Install `cifs-utils`

[code]
sudo apt-get install cifs-utils
[/code]

3. Update the unmount order to prevent CIFS from hanging during shutdown.

[code]
sudo update-rc.d -f umountnfs.sh remove
sudo update-rc.d umountnfs.sh stop 15 0 6 .
[/code]

4. Switch to the user that will have permissions over the local share; find out the UID of the user (`$USER`)

[code]
grep $USER /etc/passwd | cut -d: -f3
[/code]

5. Create a Samba credentials file, `/home/$USER/.smbcredentials`, and make it only user-readable (`chmod og-rw ~/.smbcredentials`)

[code]
username=MyUsername
password=MyPassword

# OR:
# username=MyUsername@MyDomain
# password=MyPassword

# OR: (for cifs on Windows Serve 2003)
# username=MyDomain/MyUsername
# password=MyPassword
[/code]

6. Create a new empty directory by the Linux user which will hold the client folder:

[code]
mkdir ~/mount
[/code]

6. *Very carefully* edit `/etc/fstab`, making sure that it is on one line:

[code]
//$SERVER_NAME/$SERVER_PATH /home/$USER/mount cifs iocharset=utf8,credentials=/path/to/.smbcredentials,uid=1000 0 0
[/code]

e.g.

[code]
//10.0.2.2/newsroom /home/jevon/newsroom cifs iocharset=utf8,credentials=/home/jevon/.smbcredentials,uid=1000 0 0
[/code]

7. Restart mount and hopefully everything will work!

[code]
sudo mount -a
[/code]

[[Category:Linux]]
[[Category:Ubuntu]]