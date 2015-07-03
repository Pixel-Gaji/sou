SouToDoApp.Views.TodoView = Backbone.View.extend

	tagName: "li"


	initialize: ->
		@render()


	render: ->
		@$el.text @model.get("task")
