class Model
	constructor: (opt) ->
		@power = !!opt.power
		@color = opt.color || "yellow"

	on: ->
		@power = true

	off: ->
		@power = false

	toggle: ->
		if @power then @off() if @on()
