drawing
drawOnSpartaCanvas: canvas
	super drawOnSpartaCanvas: canvas.
	
	[ renderBlock value: canvas ] on: Error do: [ :e |
		window destroy.
		e defaultAction. ]