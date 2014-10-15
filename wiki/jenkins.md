---
layout: page
title:  "Jenkins"
author: jevon
date:   2014-10-15 17:24:16 +1300
---

Also see [[Ant]], [[grunt]]

# <a href="http://www.uvd.co.uk/blog/labs/configuring-jenkins-continuous-integration-server-to-work-with-git/">Configuring Jenkins CI to work with Git on Ubuntu</a>
# [[Testing Mocha applications with Grunt using Jenkins]]

==[[GPG]] error: http://pkg.jenkins-ci.org binary/ Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY (key)==

It's actually <a href="http://askubuntu.com/questions/127326/how-to-fix-missing-gpg-keys">really simple to fix this error</a> when running `apt-get upgrade`, just redownload the public key:

[code]
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys <key>
[/code]

[[Category:Software Engineering]]
[[Category:Build]]