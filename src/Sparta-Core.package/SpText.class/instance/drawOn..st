drawing
drawOn: aCanvas
	| aRope |
	aRope := rope.
	SpartaTextRenderer new
		start: 1;
		end: aRope size;
		rope: aRope;
		renderOn: aCanvas