finalization
finalizeFontMetrics
	"Free space allocated for font metrics structure"

	(fontMetrics isNotNil and: [ fontMetrics isNull not ])
		ifTrue: [ fontMetrics free ].
	fontMetrics := nil