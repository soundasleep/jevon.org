---
layout: page
title:  Synchronising SVN and Git
author: jevon
date:   2014-08-05 17:57:48 +12:00
tags:
  - Subversion
  - Git
redirect_from:
  - "/wiki/Synchronising SVN and Git"
---

[SVN](SVN.md) / [Git](Git.md)

1. <a href="http://stackoverflow.com/questions/22549055/re-establishing-a-git-svn-clone-on-a-separate-machine">Re-establishing a git svn clone on a separate machine</a>

I wanted to clone my existing SVN repository, https://code.google.com/p/svntime/, into a new Git repository https://github.com/soundasleep/svntime.

Based on <a href="http://viget.com/extend/effectively-using-git-with-subversion">Using Git with Subversion</a> and <a href="https://help.github.com/articles/importing-from-subversion">Importing from Subversion</a>.

Note that this means that all revisions and issues will all appear to come from the same user. Setting up SVN/Git synchronisation to support multiple users with correct authentication requires <a href="https://github.com/mrts/git-svn-bridge">a lot of extra architecture and work and security for storing passwords</a>.

## 0. Create a map of SVN authors to Git authors

This will let Github blame your commits properly with the `-A` flag. For example `svn-authors.txt`:

```
soundasleep@gmail.com = Jevon Wright <jevon@jevon.org>
soundasleep = Jevon Wright <jevon@jevon.org>
(no author) = Google Code <code@google.com>
```

## 1. Clone remote SVN into local Git

1. Execute `git svn clone -s https://svntime.googlecode.com/svn/ svntime -A svn-authors.txt --prefix=origin/` (NOT the /trunk dir! The `-s` flag assumes `/trunk`.)

You can also do subdirectories within the repository for subprojects without the `-s` flag, e.g. `git svn clone https://svntime.googlecode.com/svn/trunk/sub-project/ sub-project -A svn-authors.txt`.

## 2. Push local Git into remote Git

1. Create a new empty Git repository on Github
1. Add the remote origin source: `git remote add origin https://github.com/soundasleep/svntime.git`
1. Push the SVN commits to Git: `git push origin master`

This will create individual commits for each SVN revision.

## 3. Make a local change, commit to both Git and SVN

1. Modify a file.
1. Commit it to local Git: `git add -A && git commit`
1. Push it to remote Git: `git push`
1. Commit it to remote SVN: `git svn dcommit`
1. Setup the remote Git as the remote origin: `git branch --set-upstream-to=origin/master master`

## 4. Merge remote SVN changes into local Git

1. Update the local Git from remote SVN: `git svn rebase -A ../svn-authors.txt` (each revision will appear as a new commit)
1. Push to remote Git: `git push` 

## 5. Merge remote Git changes into SVN

1. Pull from remote Git into local Git: `git pull`
1. Update the local Git from remote SVN: `git svn rebase -A ../svn-authors.txt`
1. Commit changes to remote SVN: `git svn dcommit` (each commit will appear as a new revision)

If you correctly set up the author map list, then your Github will correctly recognise old commits.

## 6. Merge a Pull Request

1. For example, https://github.com/soundasleep/openclerk/pull/1
1. Follow the Github command line instructions to checkout the pull request branch as a separate remote branch
1. Execute `git rebase` to rebase this branch to the latest master - you'll probably have to `git mergetool` a lot, since the branch will have no knowledge of master's commits
1. `git push` and `git svn dcommit` as usual

## Unable to extract revision information from commit

If you get this during a `git svn dcommit`, then you've probably messed up the merge somewhere - <a href="http://stackoverflow.com/a/7772948/39531">you need to</a> `git rebase` before you merge changes between branches.

## git svn rebase: Unknown option: strategy-option

Good luck. I think this is a bug.

## ignore-paths not matching files

It turns out the regexp accepted by `--ignore-paths` is not a complete regexp; it needs an anchor (^ or $) in order to match. So instead of doing something like `--ignore-paths=".+custom.css"`, you need to do `--ignore-paths="custom.css$"`.
