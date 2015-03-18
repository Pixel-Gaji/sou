App ->
	App(data) ->
		@collection = new Collection(data);
		@view = new CollectionView(this.collection);

	App.prototype.mount (selector) ->
		$(selector).append(@view.el);

