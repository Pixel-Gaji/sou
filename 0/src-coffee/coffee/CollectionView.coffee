class CollectionView
	constructor: (collection) ->
		@collection = collection
		@el = $('<div>')
		@render()
		@_eventify()

	_eventify: ->
		@el.on('click:switch', (e, model) =>
			_this.update(model.id)
		)

	render: ->
		@views = [];
		$frag = $(document.createDocumentFragment())

		collection.models.forEach((model, index) =>
			@views.push(modelView)
			$frag.append(modelView.el)
		)
		@el.html($frag);

		$on = $('<button>ON</button>')
			.on('click') =>
				@collection.allON()
				@updateAll()


		$off = $('<button>OFF</button>')
			.on('click') =>
				@collection.allOFF()
				@updateAll()

		@el.append($on, $off)

	update: ->
		@views[index].update()

	updateAll: ->
		@views.forEach (modelView) ->
			modelView.update();
