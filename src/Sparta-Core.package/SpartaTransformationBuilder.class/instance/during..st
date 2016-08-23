transformation
during: aBlock
	self push.
	[ aBlock cull: self ] ensure: [
		self pop ]