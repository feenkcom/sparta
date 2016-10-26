initialization
rope: aRope properties: aDictionary
	| properties |
	properties := aDictionary asDictionary.
	
	rope := aRope.
	maxWidth := properties at: #maxWidth ifAbsent: [ Float infinity ].
	maxHeight := properties at: #maxHeight ifAbsent: [ Float infinity ]