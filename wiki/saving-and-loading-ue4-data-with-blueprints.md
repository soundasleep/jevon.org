---
layout: page
title:  "Saving and Loading UE4 Data with Blueprints"
author: jevon
date:   2016-02-27 19:53:22 +1300
tags:   [Unreal Engine 4, Game Development, Visual Programming]
---

[Unreal Engine 4](unreal-engine-4.md)

<a href="https://docs.unrealengine.com/latest/INT/Gameplay/SaveGame/Blueprints/index.html">Saving your Game with Blueprints</a> covers the basics, but it doesn't cover how to actually trigger the save (e.g. quick save or quickload).

The variables you need:

<img src="/img/ue4/save-load-variables.png"> <img src="/img/ue4/save-load-group.png">

The full `MySaveGame` blueprint flow for saving and loading, by triggering events:

<img src="/img/ue4/save-load-game.png">

Triggering custom events within other blueprints from an existing blueprint - because you won't have access to the KeyInputs from the `MySaveGame` blueprint (they're only available for `Actor`s, but the `MySaveGame` needs to extend from `SaveGame`):

<img src="/img/ue4/triggering-events.png">

If classes or events are not showing up, make sure that you hit "Compile" every now and again, so that these classes and events can be picked up.
