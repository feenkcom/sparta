layer
during: aBlock

	self push.
	aBlock ensure: [ self pop ]