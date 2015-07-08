SouToDoApp = {
	init: ->

		todosCollection = new SouToDoApp.Collections.TodosCollection

		inputView =  new SouToDoApp.Views.inputView(
			{collection: todosCollection}
		)


		todosView = new SouToDoApp.Views.TodosView(
			{collection: todosCollection}
		)

		# $("#header").append(inputView.el)
		# $("#new-todo").prepend(todoView.el)

		# window.todosView = todosView
		# $("#todo-list").prepend(todosView.el)

	Models: {}
	Collections: {}
	Views: {}
}
