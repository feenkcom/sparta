api
pattern
	^ self patternBuilder
		reset;
		canvas: self;
		yourself