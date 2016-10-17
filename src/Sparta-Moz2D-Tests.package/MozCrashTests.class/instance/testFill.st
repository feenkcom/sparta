tests
testFill
	| gradient ellipse options |
	gradient := canvas paint linearGradient
		stops: {
			0 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.1).
			0.2 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.9).
			0.3 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.9).
			0.5 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 1).
			1 -> (Color r: 	198 g: 134 b: 66 range: 255) };
		begin: 0@0;
		end: self defaultExtent.
	
	ellipse := canvas shape ellipse: canvas bounds.
	options := canvas drawOptions
		alpha: 0.5;
		antialiasGray;
		composeColorDodge;
		yourself.
	
	canvas fill
		paint: gradient;
		path: ellipse;
		drawOptions: options;
		draw.
		