converting
asForm
	|canvas|
	canvas := MozCanvas checker: self formExtent.
	canvas fill
		paint: self;
		path: (0@0 extent: canvas extent);
		draw.
	^ canvas asForm