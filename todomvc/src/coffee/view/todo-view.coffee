SouToDoApp.Views.TodoView = Backbone.View.extend

	tagName: "li"

	events:
		"click .destroy": "removeTask",
		"change .toggle": "completeTask"

	template: _.template """
		<div class="view">
			<input class="toggle" type="checkbox">
			<label><%= taskName %></label>
			<button class="destroy"></button>
		</div>
		<input class="edit" value="Create a TodoMVC template">
	"""

	initialize: ->
		@listenTo @model, "destroy", @hideAnimation
		@render()


	render: ->
		# @$el.text @model.get("task")
		@$el.html @template({taskName: @model.get("task")})

	hideAnimation: ->
		@$el.fadeOut 500, =>
			@remove()
			alert ("削除完了")

	removeTask: ->
		@model.destroy()

	completeTask: ->
		@$el.find("label").css("text-decoration","line-through")
#		alert ("チェック")
#		console.log(@$el)
