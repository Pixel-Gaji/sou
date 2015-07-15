# console.log "test"
Schedule = Backbone.Model.extend

	defaults:
		title: null
		datetime: null

	validate: (attrs) ->
		if !attrs.title
			return 'タイトルは必須です'
		if !attrs.datetime
			return '日時は必須です'
		if !moment.isMoment(attrs.datetime) || !attrs.datetime.isValid()
			return '日時の形式が不正です'

	dateFormat: (f) ->
		return @get('datetime').format(f)


