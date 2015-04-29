CreateFormView = Backbone.View.extend

	events: (
		'submit': 'onSubmit'
	)

	onSubmit: (e) ->
		e.preventDefault

		title = @.$('input[name="title"]').val()
		datetime = @.$('input[name="datetime"]').val()

		@.collection.add
			title: title,
			datetime: moment(datetime)
		,
			validate: true
