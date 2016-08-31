comparing
= anObject
	self == anObject ifTrue: [ ^ true ].
	((self isKindOf: anObject class) or: [ anObject isKindOf: self class ])
		ifFalse: [ ^ false ].
	^ self bits = anObject bits
		and: [ self depth = anObject depth ]