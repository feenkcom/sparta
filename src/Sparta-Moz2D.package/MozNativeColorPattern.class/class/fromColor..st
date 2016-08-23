instance creation
fromColor: aColor

	^ (self
		primColorPatternR: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha) autoRelease