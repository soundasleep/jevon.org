---
layout: page
title:  Setting up a Samba client on Ubuntu 12.04
author: jevon
date:   2014-08-24 19:38:39 +12:00
tags:
  - Linux
  - Ubuntu
redirect_from:
  - "/wiki/setting_up_a_samba_client_on_ubuntu_12"
  - "/wiki/Setting Up A Samba Client On Ubuntu 12"
  - "/wiki/setting up a samba client on ubuntu 12"
  - "/wiki/Setting_Up_A_Samba_Client_On_Ubuntu_12"
---

[Linux](Linux.md) / [Ubuntu](Ubuntu.md) / [Samba](samba.md)

Based on <a href="https://help.ubuntu.com/community/MountWindowsSharesPermanently">MountWindowsSharesPermanently</a>, for [Ubuntu](Ubuntu.md) after 12.04:

1. Create a share on your Windows machine (the remote share)

2. Install `cifs-utils`

```
sudo apt-get install cifs-utils
```

3. Update the unmount order to prevent CIFS from hanging during shutdown.

```
sudo update-rc.d -f umountnfs.sh remove
sudo update-rc.d umountnfs.sh stop 15 0 6 .
```

4. Switch to the user that will have permissions over the local share; find out the UID of the user (`$USER`)

```
grep $USER /etc/passwd | cut -d: -f3
```

5. Create a Samba credentials file, `/home/$USER/.smbcredentials`, and make it only user-readable (`chmod og-rw ~/.smbcredentials`)

```
username=MyUsername
password=MyPassword

# OR:
# username=MyUsername@MyDomain
# password=MyPassword

# OR: (for cifs on Windows Serve 2003)
# username=MyDomain/MyUsername
# password=MyPassword
```

6. Create a new empty directory by the Linux user which will hold the client folder:

```
mkdir ~/mount
```

6. *Very carefully* edit `/etc/fstab`, making sure that it is on one line:

```
//$SERVER_NAME/$SERVER_PATH /home/$USER/mount cifs iocharset=utf8,credentials=/path/to/.smbcredentials,uid=1000 0 0
```

e.g.

```
//10.0.2.2/newsroom /home/jevon/newsroom cifs iocharset=utf8,credentials=/home/jevon/.smbcredentials,uid=1000 0 0
```

7. Restart mount and hopefully everything will work!

```
sudo mount -a
ls -la /home/$USER/mount
```
