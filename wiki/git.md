---
layout: page
title:  "Git"
author: jevon
date:   2014-01-21 15:03:41 +1300
---

==Things [[SVN]] can do that [[Git]] can't==

# Checkout into a non-empty directory; you have to checkout into a temporary directory, move the .git folder into the non-empty directory, and run a `git reset --hard`

==Branching==

Create a branch:

# `git branch <new-branch-name>` - create a new branch
# `git push origin <new-branch-name>` - ??
# `git checkout <new-branch-name>` - update local copy to branch
# `git commit -p` - commit changes to local Git
# `git push --set-upstream origin <new-branch-name>` - push local Git changes to remote Git

Switching branches:

# `git branch master` - switch back to master branch
# `git checkout master` - update local copy to master
# `git pull` - download remote Git to local Git

[[Category:Git]]
[[Category:Subversion]]