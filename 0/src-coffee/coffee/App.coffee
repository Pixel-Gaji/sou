class App
	constructor: (data) ->
		@collection = new Collection (data)
		@view = new CollectionView(@collection)

	mount: (selector) ->
		$(selector).append(@view.el)
