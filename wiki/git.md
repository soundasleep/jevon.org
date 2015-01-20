---
layout: page
title:  "Git"
author: jevon
date:   2015-01-20 16:14:27 +1300
---

# [[Synchronising SVN and Git]]
# <a href="http://www.uvd.co.uk/blog/labs/configuring-jenkins-continuous-integration-server-to-work-with-git/">Configuring Jenkins CI to work with Git on Ubuntu</a>
# To check out: <a href="https://github.com/nvie/gitflow/wiki/Windows">Using Git on Windows</a>
# [[My understanding of SVN and Git]]
# <a href="https://github.com/soundasleep/statgit/" class="github">statgit</a> - generate Git development statistics

==Things [[SVN]] can do that [[Git]] can't==

# Checkout into a non-empty directory; you have to checkout into a temporary directory, move the .git folder into the non-empty directory, and run a `git reset --hard`
# Add an empty folder. <a href="http://stackoverflow.com/a/115992/39531">It's impossible in Git</a>! `.keep` files everywhere!
# Store passwords on Windows without having to first install some horrible abomination of Cygwin/credential stores/SSH agents, or having to use the GUI client. (<a href="https://confluence.atlassian.com/display/BITBUCKET/Set+up+SSH+for+Git">Setup SSH for Git</a> and <a href="https://help.github.com/articles/why-is-git-always-asking-for-my-password">updating Git to use SSH instead of HTTPS</a>)
# Display `--help` information without opening up a `man` page or a web document (if using Windows?). The `--help` flag should _only_ print out a summary of help information to the command line.
# Keep track of resolved conflicts in other branches when merging the same branches together later on (unless `rerere` is enabled, which it isn't by default).
# Merge any branch into any other branch without later breaking history. In Git you can't ever merge a branch into another branch because this will mess up history, and possibly cause a commit loop in the future.
# SVN can never have a commit loop unless you're really trying hard (and editing metadata manually).
# Have multiple mainlines. In Git you can only ever have one mainline otherwise you risk having commit loops.
# Keep track of which branches a commit has been on. In Git, branches are entirely local to developers, and once they are merged and deleted remotely the history is completely lost (unless a non-fast-forward merge, in which case you'll have a commit stating there was a merge), because the commits are _replaced_ into the target branch. The best case scenario is <a href="http://stackoverflow.com/questions/4535251/show-the-original-branch-for-a-commit"
>if you still have the branch in your local repository</a> or the branch has not been deleted remotely yet.
# Do more than one reverse merge from a previous commit, without having to perform an intermediary commit. "<a href="https://twitter.com/soundasleep/status/480876419518455808">`revert` is not possible because you have unmerged files.</a>" You would need to use `git revert --no-commit` instead.

==Things you should never do==

# `git checkout branch; git merge master`
# `git push; git rebase`
# `git merge` (always use `--no-ff`, I don't know why this is even a Git default)

==Branching==

Create a branch:

# `git branch (new-branch-name)` - *create* a new branch, does not switch to branch
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
# `git pull origin (source-branch-name)` - update local Git from remote Git, merge in branch
# `git merge (source-branch-name)` - do the merge from the given branch (use `git mergetool` to handle unresolved conflicts)
# `git push --set-upstream origin (target-branch-name)` - push local Git to remote Git

Revert a branch merge on another branch without destroying the commits used elsewhere (technically just reverse merging):

# `git checkout (target-branch-name)`
# `git revert HEAD^` - `^` means revert back the last commit on this branch
# `git revert HEAD^^` - `^^` means revert back the second-last commit on this branch (*Git cares not about the order of commits on a branch, only individual commits with no relationship to each other!*)
# `git commit && git push` - add commit message, push the reverse merge to remote Git

Other commands:

# `git merge --abort` - revert a merge
# `git diff --cached myfile.txt` - see the diff of a _staged_ file (i.e. already been resolved)
# `git reset --hard` - throw away all local changes *including any committed, but unpushed, changes*
# `git checkout myfile.txt` - analogous to `svn revert myfile.txt`

==Merging with TortoiseMerge==

I really like [[SVN|TortoiseSVN]]'s merge tool, and with a bit of wrangling <a href="http://stackoverflow.com/questions/5190188/why-cant-i-use-tortoisemerge-as-my-git-merge-tool-on-windows">you can get Git to use it too</a>.

Add the following files to `Program Files (x86)/Git/share/git-gui/lib/mergetool.tcl` just before the `error_popup [mc "Unsupported merge tool '%s'" $tool]` block:

[code tcl]
tortoisemerge {
    set cmdline [list TortoiseMerge.exe -base:"$BASE" -mine:"$LOCAL" -theirs:"$REMOTE" -merged:"$MERGED"]
}
[/code]

And then you can run GUI merges using `git mergetool -t tortoisemerge`.

==Your configuration specifies to merge with the ref 'branch' from the remote, but no such ref was fetched.==

[code]
~$ git checkout my-branch
Switched to branch 'my-branch'
Your branch is behind 'origin/my-branch' by 3 commits, and can be fast-forwarded.
  (use "git pull" to update your local branch)

~$ git pull
Your configuration specifies to merge with the ref 'my-branch'
from the remote, but no such ref was fetched.
[/code]

This is secret Git speak for "your remote branch no longer exists". Try running a `git remote prune origin` to <a href="http://stackoverflow.com/a/1072178/39531">remove all branches that no longer exist on remote</a>.

==Having two remote repositories==

[code]
git clone https://github.com/original/foo
git remote add thirdparty https://github.com/better/foo
git push -u thirdparty master
git pull -u thirdparty
[/code]

==Getting the Github patch for a commit==

Append `.patch` to the end of the commit URL, e.g. https://github.com/soundasleep/cmis/commit/70303e60d437c1c0ee650bcf820c3a13dd4782d1.patch

==Revert a merge before it's pushed==

You have to use one of:

* `git reset --hard COMMIT_HASH`
* `git reset --hard HEAD~1` (thanks @charliesome)

[[Category:Git]]
[[Category:Subversion]]