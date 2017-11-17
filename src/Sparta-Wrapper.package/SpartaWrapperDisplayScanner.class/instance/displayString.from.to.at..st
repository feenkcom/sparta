displaying
displayString: string from: startIndex  to: stopIndex at: aPoint
	| aFont aTextPainter metrics |
	
	aFont := self canvas font build.
	
	aTextPainter := self canvas text
		font: aFont;
		text: string;
		start: startIndex;
		end: stopIndex.
		
	metrics := aTextPainter measure textMetrics bounds.
	
	aTextPainter
		baseline: aPoint - metrics origin;
		draw