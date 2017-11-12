comparing
= anotherObject
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	^ anotherObject familyName = self familyName
		and: [ anotherObject source = self source
			and: [ anotherObject stretch value = self stretch value
				and: [ anotherObject style value = self style value
					and: [ anotherObject unicodeRange = self unicodeRange
						and: [ anotherObject weight value = self weight value ] ] ] ] ]