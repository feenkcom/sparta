accessing
spacingIn: anInterval

	^ (Array new: anInterval size * 2)
		atAllPut: metricsProvider spacing;
		yourself