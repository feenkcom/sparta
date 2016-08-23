api
filters
	
	^ self filtersFactory
		reset;
		canvas: self;
		yourself