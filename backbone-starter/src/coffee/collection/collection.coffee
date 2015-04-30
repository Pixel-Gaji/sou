Schedules = Backbone.Collection.extend
	model: Schedule

	findByDate: (date) ->
		format = 'YYYY-MM-DD'
		target = moment(date).format(format)

		return @select (model) ->
			return model.dateFormat(format) == targetDate
　
