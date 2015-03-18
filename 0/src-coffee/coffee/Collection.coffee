Collection ->
	Collection(data) ->
		@data = data
		@models = []
		@_initilize()
	
	Collection.prototype._initilize ->
		_this = this
		
		@data.forEach(src, index) ->
			model = new Model src
			model.id = index
			@models.push model

	Collection.prototype.allON ->
		@models.forEach (model) ->
			model.power = true
	
	Collection.prototype.allOFF ->
		@models.forEach(model) ->
			model.power = false
