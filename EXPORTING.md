Old jevon.org
=============

This contains all of the wiki edits originally made to jevon.org, each as different commits.

Originally, jevon.org was a wiki, that allowed almost anybody to update the site.

With the jevon.org rewrite, I want to keep the old pages, and the edit history of those pages.
The plan is to clone the new site into a fork, then generate hundreds of commits (one for each
page edit), and then the fork can be merged back in - allowing the edit history to be conserved.

## Exporting

```
ruby export_and_commit.rb [database_name] [db_username] [db_password] [pause_between_commits?]
```
