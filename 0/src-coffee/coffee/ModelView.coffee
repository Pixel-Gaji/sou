class ModelView
	constructor: (model, collectionView) ->
		@collectionView = collectionView
		@model = model
		@el = $('<div>')
		@render()

	render: () ->
		_this = @;

		$frag = $(document.createDocumentFragment())
		$btn = $('<button>switch</button>')
		color = if @model.power then @model.color else 'black'

		@el.css
			backgroundColor: color,
			width: 100, height: 100

		$btn.toggleClass('on', @model.power)

		$btn.on('click') ->
			_this.model.toggle()
			_this.collectionView.trigger('click:switch', _this.model)

			$frag.append($btn)
			@el.html($frag)

	update: () ->
		color = if @model.power then @model.color else 'black'

		@el.css
			backgroundColor: color
		@el.find('button').toggleClass('on', this.model.power)

