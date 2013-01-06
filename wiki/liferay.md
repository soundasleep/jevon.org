---
layout: page
title:  "Liferay"
author: jevon
date:   2012-01-25 12:58:00 +1300
---

[[Liferay]] is a [[portlet]] and web application server written in [[Java]].

==com.liferay.portal.kernel.scheduler.SchedulerException: Unable to start scheduler==
This occured from 6.1.0RC to 6.1.0 against the same database, since the Quartz scheduler database schema changed significantly. Drop all of the QUARTZ_* tables from your 6.1.0RC installation, and replace them with the 6.1.0 versions. (The tables should be empty in your installation anyway.)

[[Category:Java]]
[[Category:Liferay]]
[[Category:Tomcat]]
[[Category:J2EE]]