displaying
fillTextBackground
	backgroundColor ifNil: [ ^ self ].
	
	self canvas fill
		paint: backgroundColor;
		path: (line left @ lineY extent: line width @ line lineHeight);
		draw