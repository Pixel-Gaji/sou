CreateFormView = Backbone.View.extend

	events: (
		'submit': 'onSubmit'
	)

	onSubmit: (e) ->
		e.preventDefault()

		title = @$('input[name="title"]').val()
		datetime = @$('input[name="datetime"]').val()

		@collection.add
			title: title,
			datetime: moment(datetime)
		,
			validate: true


CalendarView = Backbone.View.extend

	initialize: ->
		@current = moment()
		@render()
	,
	render: ->
		$caption = @$('caption')
		$tbody = @$('tbody')
		currentDay = @current.clone().startOf('month').startOf('week')
		endDay = @current.clone().endOf('month')

		$tbody.empty()
		$caption.text( @current.format('YYYY年MM月') )

		while (currentDay <= endDay)
			$tr = $('<tr>').appendTo($tbody)
			for i in [0...7]
				$td = $('<td>').text( currentDay.format('DD') ).appendTo($tr)
				currentDay.add(1, 'day')
	,
	toPrev: ->
		@current.subtract(1, 'month')
		@render()
	,
	toNext: ->
		@current.add(1, 'month')
		@render()
	,
	toToday: ->
		@current = moment()
		@render()
