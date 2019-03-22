---
layout: page
title:  My understanding of SVN and Git
author: jevon
date:   2014-04-08 20:52:14 +12:00
tags:
  - Git
  - Subversion
redirect_from:
  - "/wiki/My understanding of SVN and Git"
---

[SVN](SVN.md) / [Git](Git.md)

Based on the short white paper _Git: from the bottom up_, I've interpreted the differences between Subversion and Git as:

### Commit
* In Subversion, a commit is a set of changes to some files on your branch ("revision" or "changeset").
* In Git, a commit is a snapshot of your repository ("branch").

This is critical, and explains why Git struggles to merge without conflicts (it has no idea of changes - only top-level branch snapshots) without using advanced functionality like `rerere` (which isn't turned on by default) or using custom merge strategies.

### Parents
* In Subversion, a revision may store references to related (parent) revisions through metadata.
* In Git, a commit has multiple parents and is stored as a tree.

This means Git can _only_ be considered as a tree of repository snapshots, whereas Subversion can be considered a tree of repository changesets. To get the HEAD of a branch, in Git you just take the top commit; in Subversion, you replay through all the changesets from the root.

For a long time, Subversion did not store enough information about merged parents in metadata, which is why it had a bit of history about being terrible to merge. It now stores plenty of metadata now (and this metadata is revisioned too).

### Merge
* In Subversion, a "merge" combines the sets of changes from two branches into a new set of changes.
* In Git, a "merge" sets the parent commits of a new commit to the two trees of both branches, and this commit contains the entire merge at once.

I think this means there's almost no difference between `git merge A` into B, and `git merge B` into A - they do the same thing - but in the first case, we have A and C as tree heads, and in the second base, B and C.

This also means that a Git merge only considers the two top commits (repository snapshots) of each branch, which is why merge conflicts are so massive and requires you to re-edit whole files. Whereas Subversion considers the combination of all change sets, and only requires editing of conflicting individual diffs.

### Rebase
* In Git, a "rebase" sets the parent commit of the current branch root, to the parent commit of the source branch, and then transforms every previous branch commit to a new tree, and sets the parent commit of this tree to the top of the new branch root.

It looks like this is great as long as the commits aren't related, otherwise you'll have endless conflicts for every conflicting commit in both branches, because snapshots can only be compared in terms of files (rather than changes). Which is my experience too. However, because it's considering each commit individually rather than just the top two commits (as in the case of `merge`), it produces better conflict resolution.

The closest concept in Subversion for a rebase would be branching the target branch into a new branch, and then merging in all changesets from a different branch. This is identical to a Subversion merge, which is why the concept doesn't make sense.

### Tags
* In Subversion, a tag is the same as a branch and exists on the repository as any other branch.
* In Git, a tag is hidden away, similar to a branch but by default isn't pulled, and you can only interact with tags using voodoo magic

I guess this is because there's no concept of `/trunk` in Git, so there's no where to place a `/tags`.

### Conclusion

Git seems great if you want to spend most of your time acting as a version control repository administrator, and you want lots of powerful functionality.

The critical concept (a commit being either a changeset or a repository snapshot) does not preclude a version control system from being centralised or distributed, so why isn't there a distributed version control system based around changesets?
