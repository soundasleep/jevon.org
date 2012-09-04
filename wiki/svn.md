---
layout: page
title:  "SVN"
author: jevon
date:   2012-09-04 20:33:10 +1200
---

[[SVN]] is the acronym for [[Subversion]].

# <a href="http://journals.jevon.org/users/jevon-phd/entry/19739">Subclipse vs Subversive</a> - a discussion on [[Eclipse]] plugins
# [[StatSVN]]
# [[Slow Subversion Performance over HTTPS]]

==Error: XYZ has no ancestry information.==
This was using the Eclipse SVN client. I tried and tried and couldn't get around this error. Eventually I gave up and just moved my workspace to a new location, and checked out all my projects again.

There doesn't seem to be ANY help on the SVN mailing list about this. :(

==Error: commit item XYZ has copy flag but an invalid revision==
I think I managed to achieve this after moving a folder in Eclipse (which resulted in a ''svn add'' and ''svn delete''), renaming the folder back to the deleted folder manually in Explorer, and trying to commit. No series of updates or cleanups would resolve this.

The solution is to delete not only the containing folder of the folder, but the containing folder of _that_ folder as well. You can then update and re-merge your changes as necessary.

==Error: REPORT of XXX Could not read chunk size: Secure connection  truncated==
If your repository is being served by [[Apache]], ''and'' you are using per-directory authentication (such as `AuthzSVNAccessFile foo`), this may be <a href="http://lists.parrot.org/pipermail/parrot-dev/2009-September/002785.html">a bug with the `mod_dav_svn` module</a>:

<div class="quote">"So someone smarter than I continued where I left off and discovered that I was mostly right, there was a memory leak. But when I had tumbled off to get sleep, exhausted, he soldiered on, and tracked that leak to the DAV module (mod_dav_svn) in Apache. The problem, apparently, is that the DAV module was performing the authentication steps for every directory, every time it was accessed, and the leak was leaking during the auth process. Thus, in a large tree, the dozens or hundreds of auth steps would end up leaking the module into instability. The solution was to tell the DAV module not to reauthenticate for every path underneath the main one once the user had been authenticated into the repository. To do this, add the following statement to the apache config (in the vhost entry for the repo, in our case):

`SVNPathAuthz off`

...and in our case at least, all was well."</div>

Note that this means that per-path authentication <a href="http://svnbook.red-bean.com/en/1.5/svn.serverconfig.httpd.html">will essentially be ignored</a>.

One possible symptom of this problem is that you can `svn update` individual directories fine, but trying to `svn update` a huge directory fails. Another solution may be to refactor your repository into smaller chunks, to prevent this memory/time/stability leak.

=Alternately=
You might have a file listed locally as added, but remotely not within the repository. Check your [[Apache]] `error.log` for messages like these:

[code][error] [client 10.1.1.31] Provider encountered an error while streaming a REPORT response.  [404, #0]
[error] [client 10.1.1.31] A failure occurred while driving the update report editor  [404, #160013]
[error] [client 10.1.1.31] Working copy path XXX does not exist in repository  [404, #160013][/code]

The only solution I could think of was checking out the entire local folder again, and then manually merging any missing files through a virtual export of the problematic folder.

==Error: Error parsing svn:externals property on XXX==
This can occur if you are trying to set a `svn:externals` property without a target like so:

[code]http://url[/code]

Remember that `svn:externals` operates on a particular directory, so the property should be:

[code]directory http://url[/code]

==Read-only Database Errors==
If you get one of the following errors when trying to commit a change:

# '''Can't set file XXX read-write: The system cannot find the file specified.'''
# '''Attempt to write a readonly database'''

Then your repository database may be read-only. This can be resolved by applying a `chmod g+w REPO/db/rep-cache.db` to the repository database. (<a href="http://h3x.no/2010/12/04/svn-gives-attempt-to-write-a-readonly-database-error">more</a>)

==Error: Error reading spooled REPORT request response: digest mutual authentication failure: client nonce mismatch==
I was getting this wildly unhelpful error only in certain circumstances: SVN was working fine to update, commit and checkout, but it was failing when trying to merge branches. In particular, my SVN was setup to host via [[Apache]] using `mod_dav_svn` and using [[Digest authentication]] rather than [[SSL]].

One step to try and work out these problems is by only issuing one command at a time:

[code]>svn ls http://host/svn/project/trunk.file
trunk.file

>svn ls http://host/svn/project/trunk.file
svn: E175002: GET of '/svn/project/!
svn/bc/59/trunk/file': Digest mutual authentication failure: client nonce mismatch (http://host)
[/code]

Another thing you can try to do is to <a href="http://stackoverflow.com/a/472976/39531">set `neon-debug-mask`</a> in your client `servers` configuration file, to get much more detailed information on the authentication process (<a href="http://happygiraffe.net/blog/2009/09/23/neon-debug-mask/">refer here</a> to understand the value of this field):

[code]neon-debug-mask = 138[/code]

You might also have a problem with `svn-auth.htdigest` file having correct group permissions, but not correct user permissions.

[code]$ sudo chown www-data svn-auth.htdigest[/code]

I don't know what the actual cause of the problem was, but as I was behind a web proxy, using a different proxy (or removing the proxy entirely) solved the problem.

See also:

# <a href="http://groups.google.com/group/subversion_users/browse_thread/thread/60915473749c5937?pli=1">svn diff 'path not found' and 'Error reading spooled REPORT request response'</a>
# <a href="http://svn.haxx.se/users/archive-2007-08/0202.shtml">Can anyone help? Server was not authenticated correctly</a>

==TortoiseSVN 1.7 does not display modified svn:externals in commit dialog==
I think this has to do with the recent change to a new working copy format in 1.7.x. The solution <a href="http://tortoisesvn.tigris.org/ds/viewMessage.do?dsForumId=4061&dsMessageId=2971859">seems to involve executing a fresh checkout</a>.

[[Category:Technology]]