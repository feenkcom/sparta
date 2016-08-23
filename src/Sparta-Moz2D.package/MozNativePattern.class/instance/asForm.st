converting
asForm
	|canvas|
	canvas := MozCanvas checker: 200@200.
	canvas fill
		paint: self;
		path: (0@0 extent: canvas extent);
		draw.
	^ canvas asForm