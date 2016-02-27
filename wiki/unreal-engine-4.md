---
layout: page
title:  "Unreal Engine 4"
author: jevon
date:   2016-02-27 19:26:41 +1300
---

[[Unreal Engine 4]] is a game development engine that's shiny.

# [[Saving and Loading UE4 Data with Blueprints]]

==Making objects move after they stop==

<a href="https://answers.unrealengine.com/questions/41352/making-objects-move-after-theyve-stopped.html">The fix that worked for me</a> was:

<blockquote>
First, make sure they don't disappear after a few seconds. In the MyProjectile Blueprint's Defaults tab, change Initial Life Span to a larger number, or to 0.0 if you want them to stay forever.

Next, you'll want to make the projectiles physics actors. In the Components tab, select the [ROOT] CollisionComponent and scroll down to the Collision settings in the Details panel. For Collision Presets, choose `PhysicsActor`.

Lastly, make sure that Simulate Physics is enabled in the Physics settings.
</blockquote>

==Balls never stop rolling==

I found the best fix for this was to edit the blueprint for the `FirstPersonProjectile` and in the `Class Defaults` for the `CollisionComponent`, under `Physics`:

* Set a `Linear Dampening` and `Angular Dampening` value to something like 0.6
* Set the `Sleep Family` to `Custom` and set the `Custom Sleep Threshhold` to something ridiculous like `5000`.

=="VR Preview" is greyed out==

If you don't currently have a VR device connected, and/or you haven't installed the Oculus/SteamVR SDKs, you can enable this option by enabling the "SimpleHMD" plugin (through Project Settings) and restarting.

This will allow you to view an emulated VR stereo view.

==Show FPS in game==

In the console (by default, press tilde ~), type in `stat game` and/or `stat fps`.

==Change/remove FPS cap from 62 frames per second==

This is available in your project settings.

[[Category:Games]]
[[Category:Game Development]]
[[Category:Virtual Reality]]