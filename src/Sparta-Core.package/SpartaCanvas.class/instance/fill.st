api
fill
	"Start building a fill draw operation.
	User gets a fill painter responsible for fill creation.
	See SpartaFillPainter and SpartaPathPainter 'accessing' protocol
	for available api.

	canvas fill
		paint: Color red;
		path: (0@0 extent: 300@350);
		draw."

	^ self fillPainter
		reset;
		canvas: self;
		yourself