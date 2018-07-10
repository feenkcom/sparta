comparing
= anotherObject
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].

	^ anotherObject width = self width
		and: [ anotherObject lineCap = self lineCap
			and: [ anotherObject lineJoin = self lineJoin
				and: [ anotherObject miterLimit = self miterLimit
					and: [ anotherObject dashOffset = self dashOffset
						and: [ anotherObject dashPattern = self dashPattern ] ] ] ] ]