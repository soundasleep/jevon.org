---
layout: page
title:  Getting Git to work over SSH in Windows
author: jevon
date:   2015-03-03 14:28:08 +13:00
tags:
  - Git
  - Windows
redirect_from:
  - "/wiki/getting_git_to_work_over_ssh_in_windows"
  - "/wiki/Getting Git To Work Over Ssh In Windows"
  - "/wiki/getting git to work over ssh in windows"
  - "/wiki/Getting_Git_To_Work_Over_Ssh_In_Windows"
---

[Git](Git.md) / [Windows](Windows.md)

Good luck! You need to do something like this:

1. Install [Cygwin](cygwin.md) to install [bash](bash.md) and openssh
1. Do not use Cygwin's git; use the Windows installer from git-scm.com, otherwise your text editor (vim) will be all messed up when writing commit messages
1. You will now have a home directory `~` which will be something like `C:/cygwin/home/Jevon`
1. Create new `~/.ssh/id_rsa.pub` public keys with `ssh-keygen -t rsa` by following <a href="http://guides.beanstalkapp.com/version-control/git-on-windows.html">this article</a>
1. Import these SSH public keys into your <a href="https://github.com/settings/ssh">GitHub account SSH keys</a>
1. Make sure that your `GIT_SSH` environment variable is set to `c:/cygwin/bin/ssh` or something similar; if you installed TortoiseGit, this may be messed up to point to a Putty console
1. Add the <a href="https://help.github.com/articles/working-with-ssh-key-passphrases/">ssh-agent script</a> to your `~/.bashrc`
1. Now, you can just run `bash` in any command prompt, which will ask you for your SSH keyphrase, and you can `git push` to your hearts content without having to re-enter your passphrase every time
1. Use <a href="https://www.kirsle.net/wizards/ps1.html">this online tool</a> to customise your bash command prompt; this also goes into `~/.bashrc`.

## It's not remembering my key correctly!

This is wonderful fun. It looks like `git push` and `git pull` might use different resolutions of `GIT_SSH`, i.e. one is working within Cygwin and one is working within Windows.

I found the solution was to, in a normal command prompt, start a SSH agent:

```
C:>ssh-agent
SSH_AUTH_SOCK=/tmp/ssh-2etb0c3l0U4h/agent.14028; export SSH_AUTH_SOCK;
SSH_AGENT_PID=12016; export SSH_AGENT_PID;
echo Agent pid 12016;
```

Now, export these variables to your current session, *but change /tmp to c:/cygwin/tmp*:

```
C:>SET SSH_AUTH_SOCK=c:/cygwin/tmp/ssh-2etb0c3l0U4h/agent.14028
C:>SET SSH_AGENT_PID=12016
```

And now it will remember your authentication for this command prompt session. So frustrating. There must be some way to automate this.
