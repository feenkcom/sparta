converting
asForm
	| aCanvas |

	aCanvas := MozCanvas checker: self formExtent.
	aCanvas fill
		paint: self;
		path: aCanvas bounds;
		draw.

	^ aCanvas asForm