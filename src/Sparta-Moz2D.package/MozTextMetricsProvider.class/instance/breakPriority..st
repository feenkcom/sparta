accessing - break priority
breakPriority: aBreakPriority
	breakPriority := aBreakPriority.
	breakPriority canWrapHyphens
		ifTrue: [ self enableHyphenBreaks ]
		ifFalse: [ self disableHyphenBreaks ]