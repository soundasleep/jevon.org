---
layout: page
title:  "Citadel"
author: jevon
date:   2013-04-30 03:21:15 +1200
---

[[Citadel]] is a mail server and groupware thing for [[Linux]]. It supports [[SMTP]], [[IMAP]], [[POP3]] and [[SSL]].

==Citadel removes "From" name or replaces it with username==
While apparently you can fix this by correctly specifying the users' address book entry, this didn't fix it for me at all. Just turn off <a href="http://www.citadel.org/doku.php/faq:everydayuse:citadel_sends_my_mail_out_with_a_different_from_than_i_specified_in_my_email_client">"Correct forged From: lines during authenticated SMTP"</a>. Perhaps if you were less braindead, Citadel, this feature would actually be useful.

==Installing a custom SSL==
The <a href="http://www.citadel.org/doku.php/faq:systemadmin:how_to_install_a_certificate_signed_by_a_recognized_certificate_authority">instructions on the Citadel site</a> are pretty close, but if you already have the [[SSL]] certificate that you want to install - replace `/etc/ssl/citadel/citadel.*` with your new certificates and keys (make sure the certificate is .cer, not .crt).

==Configuring Certificate Chain File==
If your SSL certificate needs to be installed alongside a `SSLCertificateChainFile` provided by your SSL provider, then to configure the certficate chain file, you need to <a href="http://www.aerospacesoftware.com/howtos/citadel-ssl-certificate.html">''append''</a> the providers certificate into the same `/etc/ssl/citadel/citadel.cer`.

If you don't do this, you may get errors from [[Gmail]] saying <a href="http://productforums.google.com/d/topic/gmail/lE1ogJCo-o0/discussion">"SSL error: unable to verify the first certificate"</a> (<a href="http://productforums.google.com/d/topic/gmail/uPP9EsiY1rA/discussion">more discussion</a>).

==Cannot forward/receive abuse@domain emails==
By default, Citadel defines five addresses which are given "aide" permissions, meaning that incoming messages will not be subject to the normal server-side email filters: `bbs`, `root`, `Auto`, `postmaster`, and `abuse`. When replying within Webcit, the error message _Higher access is required to post in this room_ will also be displayed; otherwise, the e-mail message may simply bounce back with a similar error.

<a href="http://uncensored.citadel.org/readfwd?go=Citadel%20Support?start_reading_at=3385800#3385800">These can be removed as special user accounts</a> by editing `/etc/citadel/mail.aliases`.

[[Category:Linux]]