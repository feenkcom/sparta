finalization
finalizeTextMetrics
	"Free space allocated for text metrics structure"

	(textMetrics isNotNil and: [ textMetrics isNull not ])
		ifTrue: [ textMetrics free ].
	textMetrics := nil