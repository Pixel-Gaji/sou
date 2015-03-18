logger = new DemoLogger

logger.set(
	'app': -> 
		data = [
			{color: 'blue', power: true}
			{color: 'red', power: false}
			{}
		]

	app = new App(data)
	app.mount('#app')
)
