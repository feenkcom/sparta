finalization
release: aHandle

	aHandle isNull
		"A handle may already be null, if garbage collector did his job before us :) "
		ifTrue: [ ^ self ].

	self warning: [ '(', aHandle value asString, ') Ptr: ', aHandle value asString ].
	self primRelease: aHandle.
	aHandle getHandle beNull