api
bitmap

	^ self bitmapBuilder
		reset;
		canvas: self;
		yourself