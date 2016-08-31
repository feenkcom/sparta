comparing
= anObject
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self alpha = anObject alpha
		and: [ self antialiasMode = anObject antialiasMode
			and: [ self compositionOperator = anObject compositionOperator ] ]