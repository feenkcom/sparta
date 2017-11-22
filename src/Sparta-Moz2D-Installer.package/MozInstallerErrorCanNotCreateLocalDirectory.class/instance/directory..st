accessing
directory: anObject
	directory := anObject.
	
	self help: (self help format: { directory asString })