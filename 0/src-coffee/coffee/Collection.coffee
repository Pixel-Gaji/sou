class Colletion
	constructor: ->
		@data = data
		@models = []
		@_initilize

	_initilize: ->
		# _this = @
		@data.forEach (src, index) =>
			model = new Model src
			model.id = index
			@models.push(model)

	allON: ->
		@models.forEach (model) ->
			model.power = true

	allOFF: ->
		@models.forEach (model) ->
			model.power = false
