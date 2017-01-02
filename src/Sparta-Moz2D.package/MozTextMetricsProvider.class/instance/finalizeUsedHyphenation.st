finalization
finalizeUsedHyphenation
	"Free space allocated for used hyphenation, used during measurement process"

	(usedHyphenation isNotNil and: [ usedHyphenation isNull not ])
		ifTrue: [ usedHyphenation free ].
	usedHyphenation := nil