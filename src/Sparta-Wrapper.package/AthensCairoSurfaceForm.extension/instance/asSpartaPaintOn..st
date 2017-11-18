*Sparta-Wrapper
asSpartaPaintOn: aSpartaCanvas
	^ aSpartaCanvas paint form: (self copy: (0@0 extent: self extent))