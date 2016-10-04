rendering
renderOn: aCanvas

	layout lines do: [ :line |
		self renderLine: line on: aCanvas ]