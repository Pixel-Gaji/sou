window.App = {}
window.App.Schedule = Schedule
window.App.Schedules = Schedules
window.App.CreateFormView = CreateFormView

# console.log Schedule

$ ->
	schedules = new App.Schedules()


	createFormView = new App.CreateFormView (
		el: '.createForm',
		collection: schedules
	)

	# $('.createForm').submit (e) ->
	#	e.preventDefault()

	#	title = $('input[name="title"]').val()
	#	datetime = $('input[name="datetime"]').val()

	#	schedules.add
	#		title: title,
	#		datetime: moment(datetime)
	#	,
	#		validate: true



	$('.filterForm').submit (e) ->
		e.preventDefault()

		date = $('input[name="filterDate"]').val()
		results = schedules.findByDate(date)

		$('.count').html(results.length + '件の予定があります')
		$('.list').empty()

		_.each(results, (model) ->
			$li = $('<li>').html(
				model.dateFormat('MM月DD日 HH時mm分') + '：' + model.get('title')
			)
		)
		$('.list').append($li)




	schedules.on 'add', (model) ->
		$('.count').html(schedules.length + '件の予定があります')

		$li = $('<li>').html(
			model.dateFormat('MM月DD日 HH時mm分') + '：' + model.get('title')
		)
		$('.list').append $li




	schedules.on 'invalid', (model, message) ->
		alert(message)







# $ -> 
#	schedule = new App.Schedule()
#	window.schedule = schedule

#	schedule.on 'change' , ->
#		# console.log schedule
#		formatedTime = schedule.dateFormat('MM月DD日 HH時mm分')
#		scheduleTitle = schedule.get('title')
#		$('body').html("#{formatedTime}:#{scheduleTitle}")

#	schedule.on 'invalid' , (model, message) ->
#		alert('Error: ' + message)

#	schedule.set
#		title: '打ち合わせ'
#		datetime: moment('2013-10-26 15:00')
#	,
#		validate: true

