clipping
by: aPath during: aBlock

	self push: aPath.
	aBlock ensure: [ self pop ]