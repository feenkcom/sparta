displaying
displayString: string from: startIndex to: stopIndex at: aPoint

	self canvas text
		paint: foregroundColor;
		font: spartaFont;
		text: string;
		start: startIndex;
		end: stopIndex;
		baseline: aPoint + (0@font ascent);
		draw
		