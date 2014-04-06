---
layout: page
title:  "Synchronising SVN and Git"
author: jevon
date:   2014-04-06 21:41:19 +1200
---

[[SVN]] / [[Git]]

# <a href="http://stackoverflow.com/questions/22549055/re-establishing-a-git-svn-clone-on-a-separate-machine">Re-establishing a git svn clone on a separate machine</a>

I wanted to clone my existing SVN repository, https://code.google.com/p/svntime/, into a new Git repository https://github.com/soundasleep/svntime.

Based on <a href="http://viget.com/extend/effectively-using-git-with-subversion">Using Git with Subversion</a> and <a href="https://help.github.com/articles/importing-from-subversion">Importing from Subversion</a>.

Note that this means that all revisions and issues will all appear to come from the same user. Setting up SVN/Git synchronisation to support multiple users with correct authentication requires <a href="https://github.com/mrts/git-svn-bridge">a lot of extra architecture and work and security for storing passwords</a>.

==0. Create a map of SVN authors to Git authors==

This will let Github blame your commits properly with the `-A` flag. For example `svn-authors.txt`:

[code]
soundasleep@gmail.com = Jevon Wright <jevon@jevon.org>
soundasleep = Jevon Wright <jevon@jevon.org>
(no author) = Google Code <code@google.com>
[/code]

==1. Clone remote SVN into local Git==

# Execute `git svn clone -s https://svntime.googlecode.com/svn/ svntime -A svn-authors.txt` (NOT the /trunk dir! The `-s` flag assumes `/trunk`.)

You can also do subdirectories within the repository for subprojects without the `-s` flag, e.g. `git svn clone https://svntime.googlecode.com/svn/trunk/sub-project/ sub-project -A svn-authors.txt`.

==2. Push local Git into remote Git==

# Create a new empty Git repository on Github
# Add the remote origin source: `git remote add origin https://github.com/soundasleep/svntime.git`
# Push the SVN commits to Git: `git push origin master`

This will create individual commits for each SVN revision.

==3. Make a local change, commit to both Git and SVN==

# Modify a file.
# Commit it to local Git: `git add -A && git commit`
# Push it to remote Git: `git push`
# Commit it to remote SVN: `git svn dcommit`
# Setup the remote Git as the remote origin: `git branch --set-upstream-to=origin/master master`

==4. Merge remote SVN changes into local Git==

# Update the local Git from remote SVN: `git svn rebase -A ../svn-authors.txt` (each revision will appear as a new commit)
# Push to remote Git: `git push` 

==5. Merge remote Git changes into SVN==

# Pull from remote Git into local Git: `git pull`
# Update the local Git from remote SVN: `git svn rebase -A ../svn-authors.txt`
# Commit changes to remote SVN: `git svn dcommit` (each commit will appear as a new revision)

If you correctly set up the author map list, then your Github will correctly recognise old commits.

==6. Merge a Pull Request==

# For example, https://github.com/soundasleep/openclerk/pull/1
# Follow the Github command line instructions to checkout the pull request branch as a separate remote branch
# Execute `git rebase` to rebase this branch to the latest master - you'll probably have to `git mergetool` a lot, since the branch will have no knowledge of master's commits
# `git push` and `git svn dcommit` as usual

==Unable to extract revision information from commit==

If you get this during a `git svn dcommit`, then you've probably messed up the merge somewhere - <a href="http://stackoverflow.com/a/7772948/39531">you need to</a> `git rebase` before you merge changes between branches.

[[Category:Subversion]]
[[Category:Git]]