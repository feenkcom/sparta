api
transform

	^ self transformationBuilder
		reset;
		canvas: self;
		yourself