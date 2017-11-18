canvas
assureSpartaCanvas
	session == Smalltalk session
		ifFalse: [
			sparta := wrapper := nil.
			session := Smalltalk session ].

	(sparta isNotNil and: [ sparta extent = self canvas extent ])
		ifTrue: [ ^ self ].

	sparta := MozCanvas
		createForData: self canvas form bits
		extent: self canvas extent
		stride: self canvas form stride
		format: MozSurfaceFormat B8G8R8A8.
	wrapper := SpartaWrapperCanvas on: sparta.
	wrapper formCanvas: self canvas