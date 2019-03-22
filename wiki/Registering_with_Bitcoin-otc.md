---
layout: page
title:  "Registering with Bitcoin-otc"
author: jevon
date:   2013-10-23 19:48:51 +1300
tags:   [Bitcoin, Trust, Cryptocurrencies]
---

[Bitcoin](Bitcoin.md)

Based on the original <a href="http://wiki.bitcoin-otc.com/wiki/GPG_authentication">GPG authentication</a> and <a href="http://wiki.bitcoin-otc.com/wiki/OTC_Rating_System">OTC Rating System</a> guides.

* Generate a GPG public/private key (for example, here is my [public key](Public_Key.md))
* List the keys, and look for a line starting with `pub`. The 16-character code is your key ID:
```
$ gpg --list-keys --keyid-format long
...
pub  2048R/ABCDEF1234567890 2013-01-01
```
* Publish your public key to keyservers:
```
$ gpg --send-keys --keyserver pgp.mit.edu ABCDEF1234567890
$ gpg --send-keys --keyserver subset.pool.sks-keyservers.net ABCDEF1234567890
```
* Login into #bitcoin-otc and register your key with _gribble_ by PM:
```
nickname: ;;gpg eregister <nickname> ABCDEF1234567890
gribble: Request successful for user <nickname>, hostmask xxx!~yyy@12.34.56.78. Get your encrypted OTP from http://bitcoin-otc.com/otps/ABCDEF1234567890
```
* Download this encrypted OTP, and decrypt it with GPG (this is to verify you have the private key of the public key you just supplied):
```
$ gpg --decrypt < otp.txt
Enter passphrase:
freenode:#bitcoin-otc:32e5dae7c90dfe6dac755baa277524d43198a28536be0ddf6efe78a8
```
* Copy and paste this new command to _gribble_ via PM to verify:
```
nickname: ;;gpg everify freenode:#bitcoin-otc:32e5dae7c90dfe6dac755baa277524d43198a28536be0ddf6efe78a8
gribble: Registration successful. You are now authenticated for user nickname with key ABCDEF1234567890
```

You are now authenticated with gribble, listed in <a href="http://bitcoin-otc.com/viewratings.php">Bitcoin-otc web of trust data</a>, and you can see your total trust:

```
nickname: ;;rated jevon
gribble: You have not yet rated user jevon
nickname: ;;gettrust jevon
gribble: Currently authenticated from hostmask nickname!~xxx@12.34.56.78. Trust relationship from user nickname to user nickname: Level 1: 0, Level 2: 0 via 0 connections. Graph: http://b-otc.com/stg?source=nickname&dest=nickname | WoT data: http://b-otc.com/vrd?nick=nickname | Rated since: never
```
