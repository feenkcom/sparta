converting
asForm
	|canvas options bounds margin |
	margin := 10.
	options := MozStrokeOptions new.
	options width: 2.
	bounds := self strokedBounds: options.

	canvas := MozCanvas extent: (bounds extent + margin) asIntegerPoint.
	canvas fill
		paint: Color white;
		path: (0@0 extent: canvas extent);
		draw.
	canvas transform
		translateBy: (bounds origin negated + (margin / 2.0));
		apply.
	canvas stroke
		paint: Color black;
		path: self;
		strokeOptions: options;
	draw.
	
	^ canvas asForm