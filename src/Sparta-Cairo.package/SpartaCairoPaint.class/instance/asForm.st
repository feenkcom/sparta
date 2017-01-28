converting
asForm
	| aCanvas |

	aCanvas := SpartaCairoCanvas checker: self formExtent.
	aCanvas fill
		paint: self;
		path: aCanvas bounds;
		draw.

	^ aCanvas asForm