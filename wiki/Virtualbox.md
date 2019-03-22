---
layout: page
title:  Virtualbox
author: jevon
date:   2014-09-23 21:05:18 +12:00
tags:
  - Linux
---

[Virtualbox](virtualbox.md) allows you to run a [VM](vm.md) for [Linux](linux.md), [Windows](windows.md) or anything else.

## Getting Shared Folders working

* Guest OS: Ubuntu 12.04
* Host OS: Windows 7 x64

1. Set up a new folder in Windows e.g. `C:\vm` which will be used to host the shared folder

2. Configure the Guest Folder in the Virtualbox UI through _Machine > Settings... > Shared Folders_ and create:

* Type: Machine folder
* Folder path: `C:\vm`
* Folder name: `vm`
* Auto-mount, make permanent

3. Mount the Guest Additions CD in the Virtualbox UI through _Devices > Insert Guest Additions CD Image..._

4. <a href="http://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-a-virtualbox-vm/22745#22745">Install the Linux Guest Additions</a> from your Linux terminal (as `root`):

```
mount /dev/cdrom /mnt              # or any other mountpoint
cd /mnt
./VBoxLinuxAdditions.run
reboot
```

5. You should now have a new system path `/media/sf_vm` but you won't be able to access it except as `root`. You need to <a href="http://www.cyberciti.biz/faq/howto-linux-add-user-to-group/">add your user ID</a> to the `vboxsf` user group:

```
usermod -a -G vboxsf jevon
id jevon                       # list groups
```

6. Finally, you need to restart your SSH session so that the new groups can be picked up.

7. Optionally, create a symlink to the media folder so it's easier to find:

```
ln -s /media/sf_vm ~/vm
```
