---
layout: page
title:  "Setting up the BPFTP FTP Server"
author: jevon
date:   2005-07-06 12:06:26 +1200
tags:   [Article]
---

[Articles](Articles.md)

This (quite old, originally written in 2002) article will outline the steps needed to set up an FTP server, for use at LANs, on the Internet and in other situations. This guide goes through how to setup BPFTP/G6 FTP Server v2.0 (RC1) - it may be accurate for later versions too.

This assumes that you have downloaded a copy of Bulletproof/G6 FTP Server from http://www.bpftpserver.com .

Steps:
1. Install BPFTP/G6 Server.
1. Load BPFTP/G6 Server up. The window should open, or if it minimizes to the taskbar, double click the taskbar icon to bring it back to view.
1. Go through these steps.

## To setup user accounts
1. Go Setup > User Accounts (or press Ctrl-U).
1. Right click the "User Accounts" frame and click "Add".
1. Add the username of the account you want to add. If you want to make anonymous access, type in "Anonymous", but make sure to spell it right!! Press OK. The user account you just made will be selected.
1. If you want a password on the account, make sure that the "Password" checkbox is selected. If, however, you don't want a password (for anonymous access, for example), make sure you uncheck the Password box!
1. Now we add the directories which you want to share. Right click the Directories box in the "Access Rights" frame and click on Add.
1. Scroll through your computer and select the folder or drive that you wish to share. Now, select the attributes that you'd like to be assigned to the folder:

# Files
* "Read" means that people can download any file in that directory.
* "Write" means that people can upload to any file in that directory, but cannot overwrite or resume uploading.
* "Delete" means that people can delete files in this directory.
* "Append" means that people can resume uploading or add more data to a file. This probably only has an effect if "Upload" is selected as well.

# Directories
* "Make" means that people can make directories in this directory. Useful for directories which people can upload to.
* "List" means that people can view the files in this directory (list the contents). If you want the files in the folder to be hidden, make sure this isn't selected.
* "Delete" means that people can delete subdirectories in this directory, but only if there are no other files in the subdirectory.
* "+Subdirs" means that all the attributes above, for both Directories and Files, apply to all the subdirectories of this directory (if not overruled somewhere else). This option is very important. If you, for example, want to share D: and do not select this option, then people will only be able to access files from the root D: drive, and won't be able to open subdirectories!
* All/None switches between everything and nothing selected.

* Some common combinations of directory attributes are:
 * Shared directory: Read, List, +Subdirs
 * Uploadable directory: Read, Write, Append, Make, List, +Subdirs
 * Hidden directory: +Subdirs

1. Click "Select" when you are happy with your selection. You can change this information later. Repeat the above directory steps for each directory you wish to share.

# Miscallaneous Section
1. If you want to change the maximum number of users for this account, select and change the "Max. no of user" value. If you want to set a maximum number of connections per IP (commonly 1 connection per IP, so people aren't connected twice), change the "Max. no of connects per IP" value.
1. You may like to select the "Show relative path" checkbox. It makes no physical change in your FTP server, but lets users see "/" instead of "D:\" or "C:\Documents and Settings\User\Desktop\Share", etc.
1. You might want to enable the "Hide files/dirs with "hidden" attribute set" option if you want hidden files (like desktop.ini and system files) to not be shown.

# Links and Messages Section
If you would like a login message to be shown, you can enable it here. Login messages are text files with special codes embedded in them, which are displayed to users when they login. An example login file may be:

```
Welcome, %UIP, to Jevon's Server 2! (%S_IP - oxygen)
Brought to you by Jevon Online, http://www.jevon.org/

Serving popular files and anything else. (%DFREEGB GB free on HD.)
So far, %SESSIONGBDOWN GB (%SESSIONFILESDOWN files) leeched this session - %SERVERGBDOWN GB downloaded overall.
Speed limit: %USPEEDLIMIT up/down KB/sec (Connection is now finally 100Mbit!)
Feel free to upload anything into /Upload! :D
      
Server uptime: %SERVERDAYS day(s) %SERVERHOURS hour(s) %SERVERMINS minute(s) %SERVERSECS second(s). %CALL users have connected today.
My other FTP server is at 192.168.0.10.

You are user %CNOW out of %MAXUSERS maximum users.
```

For more information about login messages, and to have a reference list of the possible special codes (like %CNOW), see the BPFTP/G6 FTP Server helpfile.

# Ratio, Quota, Bps Section
1. Here are a few options which can change the way users transfer files.
1. Ratio means that the user has to upload X files or bytes to be able to download Y files or bytes from you. For example, if you have a 1:5 file ratio, people will have to upload one file to download five from you. If you have a 1:10 bytes ratio, people will have to upload 10MB to download 100MB from you. The "Credit" box specifies an initial credit for the user, for example you can grant them one free file, or one free megabyte transfer, before they have to start obeying the ratio.
1. Quota means that there is only a certain amount of disk space that users can upload to.
1. Speed Limit limits the speed at which you will send and recieve files. Both of these are in bytes. Some common values are 1024 bytes is 1 KB, and 1048576 bytes is 1 MB.

The rest of the tabs display generic information and have other settings for the user account. Repeat these steps for each user account.


## Server Settings
1. In the main G6 Window, select Setup > Main > General (or press Ctrl-M). This dialog box sets global settings for your server.

# General
1. Here you can change the "name" of your FTP server. The name of your server is the first thing displayed when people connect to your FTP server, before they login.
1. You can change the port number which your FTP server will operate on (the default is port 21, but you can change it from anywhere between 1 and 32000, as long as another service isn't using that port on your system). You can also change the overall maximum number of users allowed on your FTP server at once.
1. The rest of the settings are generic settings for startup.

# Options
It is recommended that "Login check" is case insensitive. This means that people can login anonymously as "Anonymous", "anonymous", "ANONYMOUS", etc. The rest of the options are optional. ;D

# Dynamic IP
If you are running your FTP server to be run from the Internet, and your IP changes often (for example, if you are on a modem, or a dynamic IP broadband connection), you might want to enable the Check for IP Changes.

# Free Files
If you have a ratio setup, you can set some files that are free to download regardless of the users credit, and do not apply to the ratio.

## Running Your Server
By default, your server is offline when you start BPFTP/G6 server. You have to explicitly tell it to go online. Click the first icon in the taskbar (it looks like a lightning bolt), or go Server > Go Online. Your server is now online! Tell people your IP address or hostname, and people will hopefully soon start connecting. :)

I hope some of this information helps. If you have any questions or want clarification, feel free to [contact me](contact.md).
----
