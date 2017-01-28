converting
asForm
	| aCanvas |

	aCanvas := MozCanvas checker: 200@200.
	aCanvas fill
		paint: self;
		path: aCanvas bounds;
		draw.

	^ aCanvas asForm