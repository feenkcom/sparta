api
bitmap
	<return: #SpartaBitmapBuilder>
	
	^ self bitmapBuilder
		reset;
		canvas: self;
		yourself