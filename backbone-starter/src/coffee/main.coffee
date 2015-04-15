window.App = {}
window.App.Schedule = Schedule;
window.App.Schedules = Schedules;

# console.log Schedule

$ ->
	schedules = new App.Schedules()
	window.schedules = schedules

	schedules.on 'add' , (model) ->
		$p = $('<p>').html(model.dateFormat('MM月DD日 HH時mm分') + '：' + model.get('title'))

		$('body').append($p)

	schedules.on 'invalid' , (model, message) ->
		alert('Error: ' + message)


	schedules.add
		title: '打ち合わせ'
		datetime: moment('2013-10-26 15:00')
	,
		validate: true

	schedules.add
		title: '勉強会'
		datetime: moment('2013-10-27 20:00')
	,
		validate: true

	schedules.add
		title: 'ラーメン'
		datetime: moment('2013-10-30 20:00')
	,
		validate: true


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

