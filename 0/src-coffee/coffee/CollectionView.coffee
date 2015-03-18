CollectionView ->
	CollectionView(collection) ->
		@collection = collection
		@el = $'<div>'
		@render()
		@_eventify()


	CollectionView.prototype._eventify ->
		_this = @
		@el.on('click:switch', (e, model) ->
			# _@render()
			_@update(model.id)
	
	CollectionView.prototype.render->
		_this = @
		
		@views = []
		$frag = $(document.createDocumentFragment())
		@collection.models.forEach (model, index) ->
			modelView = new ModelView(model, _@el)
			_@views.push(modelView)
			$frag.append(modelView.el)

		@el.html($frag)
		
		$on = $('<button>ON</button>')
			.on('click', function() {
				_@collection.allON()
				_@updateAll()
		)
		
		$off = $('<button>OFF</button>')
			.on('click', function()
				_@collection.allOFF()
				_@updateAll()
		  
		@el.append($on, $off)
		

	
	CollectionView.prototype.update (index) ->
		# @views[index].render()
		@views[index].update()
	
	CollectionView.prototype.updateAll ->
		@views.forEach(function(modelView)
			modelView.update()
