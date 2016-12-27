comparing
= anotherObject
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].

	^ anotherObject size = size
		and: [ anotherObject weight = weight
			and: [ anotherObject language = language
				and: [ anotherObject stretch = stretch
					and: [ anotherObject style = style
						and: [ anotherObject fontList = fontList ] ] ] ] ]