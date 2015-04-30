window.App = {}
window.App.Schedule = Schedule
window.App.Schedules = Schedules
window.App.CreateFormView = CreateFormView
window.App.CalendarView = CalendarView

# console.log Schedule

$ ->
	schedules = new App.Schedules()


	createFormView = new App.CreateFormView (
		el: '.createForm',
		collection: schedules
	)

	calendarView = new App.CalendarView (
		el: '.calendar',
		collection: schedules
	)



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

