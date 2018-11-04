Trait {
	#name : #TSpTextPropertiesProvider,
	#category : #'Sparta-Core-Text-Rendering'
}

{ #category : #accessing }
TSpTextPropertiesProvider >> canvas [
	"Return a canvas that is used to compute a bounding box of a string"
	<return: #SpartaCanvas>

	^ self explicitRequirement
]

{ #category : #accessing }
TSpTextPropertiesProvider >> hyphenationBreaksWithin: anInterval in: anArray [
	"Detect hyphenation break opportunities in the given range.
	Breaks not at cluster boundaries will be ignored."
	| aPrevChar anIterator |
	
	self
		assert: [ self textRun isNotNil ]
		description: [ 'Text run must not be nil' ].
	
	aPrevChar := nil.
	anIterator := self textRun iterator.
	anIterator skipUnits: anInterval first - 1.
	
	anInterval withIndexDo: [ :aTextRunIndex :anArrayIndex |
		| aChar shouldBreak |
		aChar := anIterator nextUnit.
		shouldBreak := aPrevChar = Character space or: [ aPrevChar = $- ].
		aPrevChar := aChar.
		anArray at: anArrayIndex put: shouldBreak ]
]

{ #category : #accessing }
TSpTextPropertiesProvider >> hyphensOption [
	"Returns the provider's hyphenation setting, so callers can decide
	whether it is necessary to send hyphenationBreaksWithin:
	Hyphens option can be one of NONE, AUTO or MANUAL"
	^ self explicitRequirement
]
