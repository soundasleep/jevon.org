---
layout: page
title:  "Synchronising SVN and Git"
author: jevon
date:   2014-01-30 19:14:38 +1300
---

[[SVN]] / [[Git]]

I wanted to clone my existing SVN repository, https://code.google.com/p/svntime/, into a new Git repository https://github.com/soundasleep/svntime.

Based on <a href="http://viget.com/extend/effectively-using-git-with-subversion">Using Git with Subversion</a> and <a href="https://help.github.com/articles/importing-from-subversion">Importing from Subversion</a>.

Note that this means that all revisions and issues will all appear to come from the same user. Setting up SVN/Git synchronisation to support multiple users with correct authentication requires <a href="https://github.com/mrts/git-svn-bridge">a lot of extra architecture and work and security for storing passwords</a>.

==1. Clone remote SVN into local Git==

# Execute `git svn clone -s https://svntime.googlecode.com/svn/trunk/ svntime`

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

# Update the local Git from remote SVN: `git svn rebase` (each revision will appear as a new commit)
# Push to remote Git: `git push` 

==5. Merge remote Git changes into SVN==

# Pull from remote Git into local Git: `git pull`
# Update the local Git from remote SVN: `git svn rebase`
# Commit changes to remote SVN: `git svn dcommit` (each commit will appear as a new revision)

I haven't found any way for Github to correctly recognise my old e-mail address commits as part of my Github profile: https://github.com/soundasleep/svntime/commits/master - even new commits made after adding my Google Code e-mail address as an email address to my Github profile.

[[Category:Subversion]]
[[Category:Git]]