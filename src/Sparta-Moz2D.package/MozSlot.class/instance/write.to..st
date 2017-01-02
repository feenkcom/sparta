meta-object-protocol
write: aValue to: anObject
	
	('moz slot: ' , (self read: anObject) asString, ' write: ', aValue asString) logCr.
	^ super write: aValue to: anObject