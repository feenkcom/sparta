instance creation
checker: anExtent
	|canvas checker|
	canvas := self extent: anExtent.
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
	
	"checker := MozCanvas extent: 20@20.
	checker fill
		paint: Color white;
		path: (0@0 extent: checker extent);
		draw;
		paint: Color veryVeryLightGray slightlyLighter slightlyLighter;
		path: (0@0 extent: checker extent / 2.0);
		draw;
		path: ((checker extent / 2.0) extent: checker extent / 2.0);
		draw.

	canvas fill
		paint: (canvas paint surface
			source: checker;
			repeat);
		path: (0@0 extent: canvas extent);
		draw."
	
	^ canvas