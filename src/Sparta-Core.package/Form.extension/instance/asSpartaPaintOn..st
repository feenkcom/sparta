*Sparta-Core
asSpartaPaintOn: aSpartaCanvas
	self bits isInteger
		"in order to prevent crashes, note performance loose"
		ifTrue: [ ^ aSpartaCanvas paint form: (self copy: (0@0 extent: self extent)) ].

	^ aSpartaCanvas paint form: self