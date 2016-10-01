accessing
attributes: anAttributesCollection from: aStart to: anEnd
	| rope |

	anAttributesCollection isEmpty
		ifTrue: [ ^ self ].

	(aStart = 1 and: [ anEnd = self size ])
		ifTrue: [ ^ self class attributeRope attributes: anAttributesCollection rope: self ].

	rope := self from: aStart to: anEnd.
	rope := self class attributeRope attributes: anAttributesCollection rope: rope.
	rope size = self size.
	
	^ ((self from: 1 to: aStart - 1) append: rope) append: (self from: anEnd + 1 to: self size)