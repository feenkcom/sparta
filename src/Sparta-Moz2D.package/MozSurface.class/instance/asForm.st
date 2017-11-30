converting
asForm
	| aCanvas |
	aCanvas := MozCanvas extent: self extent.
	aCanvas fill
		paint: self;
		path: (0@0 extent: aCanvas extent);
		draw.
	^ aCanvas asPureForm