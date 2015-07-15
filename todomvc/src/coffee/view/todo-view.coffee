SouToDoApp.Views.TodoView = Backbone.View.extend

	tagName: "li"

	events:
		"click .destroy": "removeTask"


	template: _.template """
		<div class="view">
			<input class="toggle" type="checkbox">
			<label><%= taskName %></label>
			<button class="destroy"></button>
		</div>
		<input class="edit" value="Create a TodoMVC template">
	"""


	initialize: ->
		@render()


	render: ->
		# @$el.text @model.get("task")
		@$el.html @template({taskName: @model.get("task")})

	removeTask: ->
		@model.destroy()

