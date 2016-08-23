api
text

	^ self textPainter
		reset;
		canvas: self;
		yourself