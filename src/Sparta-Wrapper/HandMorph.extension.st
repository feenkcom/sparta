Extension { #name : #HandMorph }

{ #category : #'*Sparta-Wrapper' }
HandMorph >> savePatchFromWrapper: aCanvas scaled: aScaleFactor [
	"Save the part of the given canvas under this hand as a Form and return its bounding rectangle."

	"Details: The previously used patch Form is recycled when possible to reduce the burden on storage management."

	| damageRect myBnds transformedBounds |
	transformedBounds := self fullBounds scaleBy: aScaleFactor.
	myBnds := transformedBounds.
	damageRect := self fullBounds.
	savedPatch
		ifNotNil: [ damageRect := myBnds
				merge: (savedPatch offset extent: savedPatch extent) ].
	(savedPatch isNil or: [ savedPatch extent ~= myBnds extent ])
		ifTrue:
			[ "allocate new patch form if needed" savedPatch := aCanvas form allocateForm: myBnds extent ]
		ifFalse: [ savedPatch := savedPatch copy ].
	aCanvas
		contentsOfArea: (myBnds translateBy: aCanvas origin)
		into: savedPatch.
	savedPatch offset: myBnds topLeft.
	^ damageRect
]
