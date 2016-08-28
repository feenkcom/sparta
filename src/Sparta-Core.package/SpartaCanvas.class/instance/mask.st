api
mask
	"Start building a mask draw operation.
	User gets a mask painter responsible for mask creation.
	See !SpartaMaskPainter 'accessing' protocol for available api.
	
	canvas mask
		source: Color green;
		mask: canvas surface;
		draw
	"
	<return: #SpartaMaskPainter>

	^ self maskPainter
		reset;
		canvas: self;
		yourself