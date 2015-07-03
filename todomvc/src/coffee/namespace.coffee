SouToDoApp = {
	init: ->
		# console.log ("初期化完了")
		# alert ("aaaa")

		# todo = new SouToDoApp.Models.TodoModel
		# console.log todo

		# todos = new SouToDoApp.Collections.TodosCollection([
		#	{task: "taskName"}
		#	{task: "taskName2"}
		# ])
		# console.log todos

		todosCollection = new SouToDoApp.Collections.TodosCollection

		inputView =  new SouToDoApp.Views.inputView(
			{collection: todosCollection}
		)

		todo = new SouToDoApp.Models.TodoModel(
			{task: "タスク"}
		)


		todosView = new SouToDoApp.Views.TodosView(
			collection: todosCollection
		)

		# $("#header").append(inputView.el)
		# $("#new-todo").prepend(todoView.el)
		window.todoView = todoView
		$("body").prepend(todoView.el)

	Models: {}
	Collections: {}
	Views: {}
}
