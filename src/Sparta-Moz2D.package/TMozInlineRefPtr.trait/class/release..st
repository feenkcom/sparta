finalization
release: aHandle

	aHandle isNull
		"A handle may already be null, if garbage collector did his job before us :) "
		ifTrue: [ ^ self ].

	self primRelease: aHandle.
		
	"always nullify handle, since object gets garbage collected on pharo side"
	aHandle getHandle beNull