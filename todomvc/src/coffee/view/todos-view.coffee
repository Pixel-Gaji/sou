SouToDoApp.Views.TodosView = Backbone.View.extend

	tagName: "ul"


	initialize: ->
		@render()
		console.log @collection
		@listenTo @collection, "add", =>
			@render()
		# @listenTo @collection, "all", =>
		# console.log arguments


	render: ->
		todoView = new SouToDoApp.Views.TodoView(
			model: @collection
		)
		
