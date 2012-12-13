---
layout: page
title:  "Linux"
author: jevon
date:   2012-12-13 17:25:32 +1300
---

[[Articles]]

# [[A Crude Latex Diff Script in Linux]]
# [[Installing PHP 5.2 on CentOS]]
# [[Citadel]]

[code]ln -s <target> <source>     : create symbolic link
echo $?                     : print last return value int
tar -zcf out.tar.gz folder  : compress folder to .tar.gz
tar xzf out.tar.gz folder   : extract .tar.gz to folder
mogrify -format eps *.png   : convert all *.png to *.eps
sh -x <script>              : show all commands executed by given script for debug[/code]

If this fails, the version of tar may not support gzip compression. In this case, you can use the traditional two-stage command:
gzip -dc filename.tar.gz | tar xf -

==Commit directories to [[SVN]] individually==
[code]find . -maxdepth 1 -regex ./[A-Za-z0-9].+ -exec svn commit '{}' --message "Adding {} pictures folder to repository" ;[/code]

* "find ." matches all files and directories in the current directory
* "-maxdepth 1" only matches top-level directories
* "-regex ./[A-Za-z0-9].+" removes the ./ directory
* "-exec svn commit" runs "svn commit" with each result
* "{}" is replaced with the result directory name
* ; is required to end the line

Also see http://www.pixelbeat.org/cmdline.html for a neat reference.

==Joining multiple PDFs together==
If they're all the same size, you can use Ghostscript:

[code]gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=out.pdf in1.pdf in2.pdf in3.pdf[/code]

==Misc Notes==
[code]./configure: line 23: syntax error near unexpected token `$'inr''[/code]

The configure file line endings has changed from Unix style to [[Windows]] style (probably winzip being stupid). To fix:

[code]$ vim ./configure
:set ff=unix
:wq[/code]

==Adding a New Sudo User==
Create a new user:

[code]
root@server:~$ sudo adduser username
[sudo] password for root:
Adding user 'username' ...
Adding new group 'username' (1234) ...
Adding new user 'username' (1234) with group 'username' ...
Creating home directory '/home/username' ...
Copying files from '/etc/skel' ...
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
Changing the user information for username
Enter the new value, or press ENTER for the default
        Full Name []: Your Name
        Room Number []:
        Work Phone []: 
        Home Phone []:
        Other []: 
Is the information correct? [Y/n] y
[/code]

<a href="http://www.ubuntuka.com/add-user-to-existing-group-ubuntu/">Add it to the</a> admin user group:

[code]sudo usermod -a -G admin username[/code]

Or, define it as an explicit member of the admin group:

[code]sudo usermod -g admin username[/code]

Alternatively, you could use `visudo`, but be careful when editing the `sudoers` file!

[[Category:Article]]
[[Category:Linux]]