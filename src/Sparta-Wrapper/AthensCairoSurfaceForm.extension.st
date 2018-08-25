Extension { #name : #AthensCairoSurfaceForm }

{ #category : #'*Sparta-Wrapper' }
AthensCairoSurfaceForm >> asSpartaPaintOn: aSpartaCanvas [
	^ aSpartaCanvas paint form: (self copy: (0@0 extent: self extent))
]
