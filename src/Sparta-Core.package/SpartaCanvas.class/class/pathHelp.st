help
pathHelp
	^
'canvas path
	- to start creating a path using path builder
	
	canvas path
		moveTo: 150@50;
		lineTo: 250@250;
		curveVia: 150@300 to: 50@250;
		close;
		finish'