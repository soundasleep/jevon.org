---
layout: page
title:  "Synchronising SVN and Git"
author: jevon
date:   2014-01-30 19:33:18 +1300
---

[[SVN]] / [[Git]]

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

[[Category:Subversion]]
[[Category:Git]]