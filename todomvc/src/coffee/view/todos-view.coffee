SouToDoApp.Views.TodosView = Backbone.View.extend

	tagName: "ul"


	initialize: ->
		@listenTo @collection, "add", @render


	render: (todo)->
		# console.log todo
		todoView = new SouToDoApp.Views.TodoView(
			model: todo
		)
		# @$el.prepend(todoView.el)
		$("#todo-list").prepend(todoView.el)
