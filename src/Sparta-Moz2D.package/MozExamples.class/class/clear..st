private
clear: aCanvas
	aCanvas fill
		paint: Color white;
		path: (0@0 extent: aCanvas extent);
		draw.

	aCanvas fill
		paint: Color white;
		path: (0@0 extent: aCanvas extent);
		drawOptions: (aCanvas drawOptions
			composeDestOut);
		draw.