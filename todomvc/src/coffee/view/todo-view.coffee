SouToDoApp.Views.TodoView = Backbone.View.extend

	tagName: "p"


	initialize: ->
		console.log @model.get "task"
		@render()

	render: ->
		@$el.text @model.get "task"
