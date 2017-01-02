finalization
finalizeLastBreak
	"Free space allocated for last break, used during measurement process"

	(lastBreak isNotNil and: [ lastBreak isNull not ])
		ifTrue: [ lastBreak free ].
	lastBreak := nil