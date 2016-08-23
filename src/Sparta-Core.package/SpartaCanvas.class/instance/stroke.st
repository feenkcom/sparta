api
stroke
	"Start building a stroke draw operation.
	User gets a stroke painter responsible for stroke creation.
	See SpartaStrokePainter and SpartaPathPainter 'accessing' protocol
	for available api.

	canvas stroke
		paint: (Color blue alpha: 0.8);
		path: (0@0 extent: 300@350);
		strokeOptions: (canvas strokeOptions
			width: 5);
		draw."

	^ self strokePainter
		reset;
		canvas: self;
		yourself