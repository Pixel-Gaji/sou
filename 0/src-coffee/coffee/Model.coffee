Model ->
	Model(opt) ->
		@power = !!opt.power
		@color = opt.color || 'yellow'
  
	Model.prototype.on ->
		@power = true

	Model.prototype.off ->
		@power = false

	Model.prototype.toggle ->
		if @power then @off() else @on()

