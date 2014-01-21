---
layout: page
title:  "Adding properties to a model within an EmberJS router"
author: jevon
date:   2014-01-21 20:47:21 +1300
---

[[EmberJS]]

With the following router and handlebars code, I wanted to add a runtime property from the router to the template/view (note, using [[CoffeeScript]]):

[code coffee]
Todos.TodosIndexRoute = Ember.Route.extend(
	model: ->
		@modelFor 'todos'

	renderTemplate: (controller) ->
		@render 'todos/index',
			controller: controller
)
[/code]

What you need to do is create a new `setupController` function, but this must both set the `model` _again_, along with any other parameters:

[code coffee]
Todos.TodosIndexRoute = Ember.Route.extend(
	model: ->
		@modelFor 'todos'

	renderTemplate: (controller) ->
		@render 'todos/index',
			controller: controller

	setupController: (controller, model) ->
		controller.set 'route', 'index'
		controller.set 'model', model     // critical - otherwise 'model' will be lost
)
[/code]

This can then be used as normal Handlebars code, i.e.:

[code handlebars]
<script type="text/x-handlebars" data-template-name="todos/index">
  {{{empty}}{route}}
  <ul id="todo-list">
    {{{empty}}{#each itemController="todo"}}
      // ...
    {{{empty}}{/each}}
  </ul>
</script>
[/code]

See also <a href="http://stackoverflow.com/questions/14905264/unable-to-render-template-with-data-set-in-setupcontroller/21274223#21274223">this StackOverflow discussion</a> (not sure if it's related).

[[Category:Web Development]]
[[Category:Javascript]]
[[Category:EmberJS]]