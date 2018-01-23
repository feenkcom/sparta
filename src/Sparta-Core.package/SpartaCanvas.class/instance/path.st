api
path
	"Start building a vector path with nonzero(default) fill rule.
	User gets a path builder responsible for path creation.
	See !TSpartaPathBuilder for available api.
	
	canvas path
		moveTo: 150@50;
		lineTo: 250@250;
		curveVia: 150@300 to: 50@250;
		close;
		finish.
	"
	<return: #TSpartaPathBuilder>

	^ self path: #nonzero