drawing-text
drawString: s from: firstIndex to: lastIndex in: boundsRect font: fontOrNil color: c
	| aLogicalFont aFont textPainter metrics |
	
	aLogicalFont := fontOrNil ifNil: [ StandardFonts defaultFont ].
		
	aFont := self canvas font
		named: aLogicalFont familyName;
		weight: aLogicalFont weightValue;
		size: aLogicalFont pixelSize;
		build.	

	textPainter := self canvas text
		font: aFont;
		text: s asString;
		start: firstIndex;
		end: lastIndex;
		paint: c.
		
	metrics := textPainter measure textMetrics bounds.
	
	textPainter 
		baseline: (boundsRect origin asFloatPoint - metrics origin + (0@1));
		draw