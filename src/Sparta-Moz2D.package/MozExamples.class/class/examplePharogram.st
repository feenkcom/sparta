examples
examplePharogram
	|form canvas image nashville inkwell brannan|
	
	form := Form fromFileNamed: 'images/animals.jpg'. 

	canvas := MozCanvas extent: form extent * 2.

	image := canvas bitmap fromForm: form.

	nashville := canvas filters nashville: image.
	inkwell := canvas filters inkwell: image.
	brannan := canvas filters brannan: image.

	canvas fill
		paint: image;
		path: image bounds;
		draw.

	canvas filter
		area: (0@0 extent: image extent);
		to: image extent x @ 0;
		type: nashville;
		draw.

	canvas filter
		area: (0@0 extent: image extent);
		to: 0 @ image extent y;
		type: inkwell;
		draw.
	
	canvas filter
		area: (0@0 extent: image extent);
		to: image extent;
		type: brannan;
		draw.

	canvas asForm asMorph openInWindowLabeled: 'Pharogram'