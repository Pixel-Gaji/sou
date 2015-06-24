SouToDoApp = {
	init: ->
		console.log ("初期化完了")
		# alert ("aaaa")

		# todo = new SouToDoApp.Models.TodoModel
		# console.log todo

		# todos = new SouToDoApp.Collections.TodosCollection([
		#	{task: "taskName"}
		#	{task: "taskName2"}
		# ])
		# console.log todos

		todo = new SouToDoApp.Models.TodoModel(
			{task: "タスク"}
		)
		# console.log todo


		todoView = new SouToDoApp.Views.TodoView(
			{model: todo}
		)
		console.log todoView
		$("body").prepend(todoView.el)
		window.todoView = todoView


	Models: {}
	Collections: {}
	Views: {}
}
