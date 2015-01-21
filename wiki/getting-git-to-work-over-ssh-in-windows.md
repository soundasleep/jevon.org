---
layout: page
title:  "Getting Git to work over SSH in Windows"
author: jevon
date:   2015-01-21 15:07:01 +1300
---

[[Git]]

Good luck! You need to do something like this:

# Install [[Cygwin]] to install [[bash]] and openssh
# You will now have a home directory `~` which will be something like `C:/cygwin/home/Jevon`
# Create new `~/.ssh/id_rsa.pub` public keys with `ssh-keygen -t rsa` by following <a href="http://guides.beanstalkapp.com/version-control/git-on-windows.html">this article</a>
# Import these SSH public keys into your <a href="https://github.com/settings/ssh">GitHub account SSH keys</a>
# Make sure that your `GIT_SSH` environment variable is set to `c:/cygwin/bin/ssh` or something similar; if you installed TortoiseGit, this may be messed up to point to a Putty console
# Add the <a href="https://help.github.com/articles/working-with-ssh-key-passphrases/">ssh-agent script</a> to your `~/.bashrc`
# Now, you can just run `bash` in any command prompt, which will ask you for your SSH keyphrase, and you can `git push` to your hearts content.

[[Category:Git]]