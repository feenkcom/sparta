Extension { #name : #InfiniteForm }

{ #category : #'*Sparta-Wrapper' }
InfiniteForm >> asSpartaPaintOn: aSpartaCanvas [
	| aBitmap |
	aBitmap := aSpartaCanvas bitmap fromForm: patternForm.
	^ aSpartaCanvas paint surface
		source: aBitmap;
		repeat
]
