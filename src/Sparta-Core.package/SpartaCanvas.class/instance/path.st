api
path
	"Start building a vector path.
	User gets a path builder responsible for path creation.
	See TSpartaPathBuilder for available api.
	
	canvas path
		moveTo: 150@50;
		lineTo: 250@250;
		curveVia: 150@300 to: 50@250;
		close;
		finish."

	^ self pathBuilder