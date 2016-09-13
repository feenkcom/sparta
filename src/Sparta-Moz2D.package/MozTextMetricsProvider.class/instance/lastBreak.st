accessing - metrics
lastBreak

	^ lastBreak isNull
		ifTrue: [ SmallInteger maxVal ]
		ifFalse: [ lastBreak unsignedLongAt: 1 ]