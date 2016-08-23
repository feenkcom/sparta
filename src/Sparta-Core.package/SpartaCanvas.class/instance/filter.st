api
filter
	"Start building a filter draw operation.
	User gets a filter painter responsible for filter creation.
	See SpartaFilterPainter 'accessing' protocol for available api.
	Also refer to my 'filter' protocol in order to create specific
	filter types.

	canvas filter
		area: (00@00 extent: 300@350);
		type: (canvas gaussianBlurFilter
			stdDeviation: 4;
			source: canvas surface);
		draw"
	
	^ self filterPainter
		reset;
		canvas: self;
		yourself