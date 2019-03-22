---
layout: page
title:  Thunderbird
author: jevon
date:   2013-11-24 13:31:45 +13:00
tags:
  - Applications
redirect_from:
  - "/wiki/thunderbird"
---

An [email](email.md) client from [Mozilla](mozilla.md).

## Importing an old Thunderbird profile
It's easy to import an old Thunderbird profile into a fresh new install.

1. Install Thunderbird and let it create a new profile.
1. Copy and paste the old profile data (Mail folders, etc) into the new profile.
1. Start the fresh install of Thunderbird.

Thunderbird will automatically load the old profile information (including saved passwords and mail filters, along with all old e-mails).

## Invalid SSL Certificates with Avast and Thunderbird
[Avast](avast.md) and Thunderbird don't play well together at all, because Avast decides to intercept SSL mail connections and insert in their own certificate. You may get the following errors:

```
An error occurred during a connection to imap.gmail.com:993. 

You have received an invalid certificate.  Please contact the server administrator or email correspondent and give them the following information:  Your certificate contains the same serial number as another certificate issued by the certificate authority.  Please get a new certificate containing a unique serial number.

(Error code: sec_error_reused_issuer_and_serial)
```

This means you need to follow <a href="http://www.avast.com/faq.php?article=AVKB91">these instructions</a> to export the Avast authority certificate and import it into the Thunderbird security manager.

*Make sure* that you have deleted any other Avast! mail scanner certificates.

```
imap.gmail.com:993 uses an invalid security certificate.

The certificate is not trusted because the issuer certificate is not trusted.

(Error code: sec_error_untrusted_issuer)
```

It seems this error is false. If you simply accept it (but _do not accept it permanently_) then eventually everything will work.
