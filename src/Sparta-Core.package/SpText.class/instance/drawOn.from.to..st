drawing
drawOn: aCanvas from: aStart to: anEnd
	| aRope |
	aRope := rope.
	SpartaTextRenderer new
		start: aStart;
		end: anEnd;
		rope: aRope;
		renderOn: aCanvas