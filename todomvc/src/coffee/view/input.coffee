SouToDoApp.Views.inputView = Backbone.View.extend

	el: "#inputForm"
	events: 
		"submit": "testSubmit"

	initialize: ->
		# console.log @el
		# @render()
		# @listenTo @model, "change", ->
			# @render()

	testSubmit: (ev) ->
		ev.preventDefault()
		$input = @$("#new-todo")
		inputTask = $input.val()
		@collection.add(
			task: inputTask
		)
		$input.val('')
		# alert inputTask
