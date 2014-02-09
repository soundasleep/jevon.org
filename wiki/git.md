---
layout: page
title:  "Git"
author: jevon
date:   2014-02-09 17:48:22 +1300
---

# [[Synchronising SVN and Git]]
# To check out: <a href="https://github.com/nvie/gitflow/wiki/Windows">Using Git on Windows</a>

==Things [[SVN]] can do that [[Git]] can't==

# Checkout into a non-empty directory; you have to checkout into a temporary directory, move the .git folder into the non-empty directory, and run a `git reset --hard`
# Add an empty folder. <a href="http://stackoverflow.com/a/115992/39531">It's impossible in Git</a>! `.keep` files everywhere!
# Store passwords on Windows without having to first install some horrible abomination of Cygwin/credential stores/SSH agents, or having to use the GUI client. (<a href="https://confluence.atlassian.com/display/BITBUCKET/Set+up+SSH+for+Git">Setup SSH for Git</a> and <a href="https://help.github.com/articles/why-is-git-always-asking-for-my-password">updating Git to use SSH instead of HTTPS</a>)

==Branching==

Create a branch:

# `git branch (new-branch-name)` - *create* a new branch
# `git push origin (new-branch-name)` - ??
# `git checkout (new-branch-name)` - switch to branch and update local copy to branch
# `git commit -p` - commit changes to local Git
# `git push --set-upstream origin (new-branch-name)` - push local Git changes to remote Git

Switching branches:

# `git checkout master` - switch back to master and update local copy to master
# `git pull` - download remote Git to local Git

<a href="http://stackoverflow.com/questions/5601931/best-and-safest-way-to-merge-a-git-branch-into-master">Merge branch back in</a>:

# `git checkout master` - switch back to master and update local copy to master
# `git pull origin master` - update local Git from remote Git
# `git merge (new-branch-name)` - do the merge from the given branch (I don't know what happens with conflicts!)
# `git push origin master` - push local Git to remote Git

Merge two different branches (e.g. you are working on _target_ and want to merge in branch _source_):

# `git checkout (target-branch-name)` - switch back to master and update local copy to master
# `git pull origin (target-branch-name)` - update local Git from remote Git
# `git merge (source-branch-name)` - do the merge from the given branch (I don't know what happens with conflicts!)
# `git push --set-upstream origin (target-branch-name)` - push local Git to remote Git

[[Category:Git]]
[[Category:Subversion]]