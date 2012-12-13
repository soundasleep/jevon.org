---
layout: page
title:  "Citadel"
author: jevon
date:   2012-12-13 17:29:08 +1300
---

[[Citadel]] is a mail server and groupware thing for [[Linux]]. It supports [[SMTP]], [[IMAP]], [[POP3]] and [[SSL]].

==Installing a custom SSL==
The <a href="http://www.citadel.org/doku.php/faq:systemadmin:how_to_install_a_certificate_signed_by_a_recognized_certificate_authority">instructions on the Citadel site</a> are pretty close, but if you already have the [[SSL]] certificate that you want to install - replace `/etc/ssl/citadel/citadel.*` with your new certificates and keys (make sure the certificate is .cer, not .crt).

==Configuring Certificate Chain File==
If your SSL certificate needs to be installed alongside a `SSLCertificateChainFile` provided by your SSL provider, then to configure the certficate chain file, you need to <a href="http://www.aerospacesoftware.com/howtos/citadel-ssl-certificate.html">''append''</a> the providers certificate into the same `/etc/ssl/citadel/citadel.cer`.

If you don't do this, you may get errors from [[Gmail]] saying <a href="http://productforums.google.com/d/topic/gmail/lE1ogJCo-o0/discussion">"SSL error: unable to verify the first certificate"</a> (<a href="http://productforums.google.com/d/topic/gmail/uPP9EsiY1rA/discussion">more discussion</a>).

[[Category:Linux]]