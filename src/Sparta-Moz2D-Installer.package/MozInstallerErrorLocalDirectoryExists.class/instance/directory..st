accessing
directory: anObject
	directory := anObject.
	
	self messageText: (self messageText format: { directory asString })