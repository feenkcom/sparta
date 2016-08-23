finalization
release: aHandle
	
	aHandle isNull
		ifTrue: [
			self warning: [ 'Trying to release null pointer!' ].
			^ self ].
	
	(self primRefCount: aHandle value) = 0
		ifTrue: [ 
			self warning: [ 'Trying to release a reference with 0 refCount!' ].
			^ self ].
	
	self warning: [ '(', aHandle value asString, ') RefCount: ', ((self primRefCount: aHandle value) - 1) asString ].
	self primRelease: aHandle value