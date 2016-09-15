finalization
release: aHandle
	
	aHandle isNull
		ifTrue: [
			self warning: [ 'Trying to release null pointer!' ].
			^ self ].

	self warning: [ '(', aHandle value asString, ') Ptr: ', aHandle value asString ].
	self primRelease: aHandle value