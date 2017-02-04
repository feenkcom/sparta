enumeration
iterator

	^ self is8Bit
		ifTrue: [ SpTextRunIterator8Bit on: self ]
		ifFalse: [ self is16Bit
			ifTrue: [ SpTextRunIterator16Bit on: self ]
			ifFalse: [ self is32Bit
				ifTrue: [ SpTextRunIterator32Bit on: self ]
				ifFalse: [ self error: 'Unknown UTF type: ', self bits asString ] ] ]