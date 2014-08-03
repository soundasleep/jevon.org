---
layout: page
title:  "Linux"
author: jevon
date:   2014-08-03 19:57:48 +1200
---

[[Articles]]

# [[A Crude Latex Diff Script in Linux]]
# [[Installing PHP 5.2 on CentOS]]
# [[Citadel]]
# [[Ubuntu]]
# [[UEFI]]
# <a href="http://www.delicious.com/jevonwright/linux" class="delicious">Other pages tagged as "linux"</a>

[code bash]
ln -s <target> <source>     # create symbolic link
echo $?                     # print last return value int
tar -zcf out.tar.gz folder  # compress folder to .tar.gz
tar xzf out.tar.gz folder   # extract .tar.gz to folder
mogrify -format eps *.png   # convert all *.png to *.eps
sh -x <script>              # show all commands executed by given script for debug
df -h                       # show disk usage and free space
[/code]

If this fails, the version of tar may not support gzip compression. In this case, you can use the traditional two-stage command:
gzip -dc filename.tar.gz | tar xf -

==Commit directories to [[SVN]] individually==
[code bash]find . -maxdepth 1 -regex ./[A-Za-z0-9].+ -exec svn commit '{}' --message "Adding {} pictures folder to repository" ;[/code]

* "find ." matches all files and directories in the current directory
* "-maxdepth 1" only matches top-level directories
* "-regex ./[A-Za-z0-9].+" removes the ./ directory
* "-exec svn commit" runs "svn commit" with each result
* "{}" is replaced with the result directory name
* ; is required to end the line

Also see http://www.pixelbeat.org/cmdline.html for a neat reference.

==Joining multiple PDFs together==
If they're all the same size, you can use Ghostscript:

[code bash]gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=out.pdf in1.pdf in2.pdf in3.pdf[/code]

==Misc Notes==
[code text]./configure: line 23: syntax error near unexpected token `$'inr''[/code]

The configure file line endings has changed from Unix style to [[Windows]] style (probably winzip being stupid). To fix:

[code bash]$ vim ./configure
:set ff=unix
:wq[/code]

==Adding a New Sudo User==
Create a new user:

[code text]
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

<a href="http://www.ubuntuka.com/add-user-to-existing-group-ubuntu/">Add it to the</a> admin user group (or `adm`):

[code]sudo usermod -a -G admin username[/code]

Or, define it as an explicit member of the admin group (or `adm` group):

[code]sudo usermod -g admin username[/code]

Or, define it explicitly as someone who can sudo (necessary on new Ubuntu releases):

[code]sudo adduser username sudo[/code]

Alternatively, you could use `visudo`, but be careful when editing the `sudoers` file!

==Chaining Greps when Tailing a File==
If you are tailing a file and trying to execute multiple greps, you can't just chain them using pipes:

[code bash]tail -f /my/file.log | grep -v a | grep -v b | grep -v c[/code]

You <a href="https://makandracards.com/makandra/5403-how-to-combine-greps-on-log-files-opened-with-tail-f">need to add</a> the flag `--line-buffered" to each grep.

[code bash]tail -f /my/file.log | grep --line-buffered -v a | grep --line-buffered -v b | ...[/code]

==spamd: still running as root, safe_lock: cannot create tmp lockfile /nonexistent/.spamassassin==
If you have <a href="http://library.linode.com/email/citadel/ubuntu-10.04-lucid#sph_enabling-spamassassin-filtering">configured your site to use Spamassassain</a>, and your `/var/log/mail.log` includes messages such as:

[code]
spamd: still running as root: user not specified with -u, not found, or set to root, falling back to nobody
plugin: eval failed: bayes: (in learn) locker: safe_lock: cannot create tmp lockfile /nonexistent/.spamassassin/bayes.lock.my.domain.6304 for /nonexistent/.spamassassin/bayes.lock: No such file or directory
[/code]

This is because [[spamassassin]] is not being run as a particular user, or is being run as root. According to `/usr/share/doc/spamassassin/README.spamd` this is technically OK, but it's easier just to create a new user for spamd to run as. Create a new user with `adduser --system`, and then modify `/etc/default/spamassassin` (<a href="http://superuser.com/questions/354944/what-is-the-purpose-of-etc-default">designed to be edited</a> on [[Ubuntu]]):

[code]
OPTIONS="--create-prefs --max-children 5 --helper-home-dir -u spamd"
[/code]

(<a href="http://www.webhostingtalk.com/showthread.php?t=879143">Reference</a>)

==Installing an X server to startup at boot==
I tried installing a basic X server (called a "client") using `sudo apt-get install xauth` and `sudo apt-get install xorg` (<a href="https://help.ubuntu.com/community/ServerGUI">as recommended by Ubuntu</a>). However I couldn't get the X server to start at boot. I even tried creating a file `/etc/init.d/xserver` with the single command `exec startx`, but this didn't do anything unless I executed the script as a user (no, I don't know enough about `init.d` yet).

The solution was to install a display manager such as Gnome's. `sudo apt-get install gdm` followed by a `sudo shutdown -r now`, and now an X server was running at startup so I can do things like this:

[code]
DISPLAY=:0 sudo aticonfig --adapter=all --odgt
[/code]

[[Category:Article]]
[[Category:Linux]]