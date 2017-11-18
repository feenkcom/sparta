drawing-text
drawString: s from: firstIndex to: lastIndex in: boundsRect font: fontOrNil color: c
	| aLogicalFont aFont |
	
	aLogicalFont := fontOrNil ifNil: [ StandardFonts defaultFont ].
		
	aFont := self canvas font
		logical: aLogicalFont;
		build.	

	self canvas text
		font: aFont;
		text: s asString;
		start: firstIndex;
		end: lastIndex;
		paint: c;
		baseline: (boundsRect origin asFloatPoint + (0@aLogicalFont ascent));
		draw