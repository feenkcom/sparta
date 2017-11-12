comparing
= anotherObject
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].

	^ anotherObject getHandle getHandle = self getHandle getHandle
		and: [ anotherObject name = self name
			and: [ anotherObject source = self source ] ]
			