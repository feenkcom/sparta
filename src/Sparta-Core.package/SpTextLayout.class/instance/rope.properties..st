initialization
rope: aRope properties: aDictionary
	"Initialize me with an immutable rope and properties as dictionary.
	Note, that I can be only initialized once."
	| aProperties |
	
	self
		assert: [ rope isNil ]
		description: [ 'I am immutable! You should create a new instance' ].
	
	aProperties := aDictionary asDictionary.

	rope := aRope.
	maxWidth := aProperties at: #maxWidth ifAbsent: [ Float infinity ].
	maxHeight := aProperties at: #maxHeight ifAbsent: [ Float infinity ].
	autoRelease := aProperties at: #autoRelease ifAbsent: [ true ]