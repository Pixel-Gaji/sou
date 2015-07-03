SouToDoApp.Views.inputView = Backbone.View.extend

	el: "#inputForm"
	events: 
		"submit":"testSubmit"

	initialize: ->
		# console.log @el
		# @render()
		# @listenTo @model, "change", ->
			# @render()

	testSubmit: (ev) ->
		ev.preventDefault()
		inputTask = @$("#new-todo").val()
		@collection.add(
			task: inputTask
		)
		# alert inputTask
		console.log this.collection

