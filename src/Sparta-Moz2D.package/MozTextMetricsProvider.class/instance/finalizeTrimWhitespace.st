finalization
finalizeTrimWhitespace
	"Free space allocated for trimmed whitespace, used during measurement process"

	(trimWhitespace isNotNil and: [ trimWhitespace isNull not ])
		ifTrue: [ trimWhitespace free ].
	trimWhitespace := nil