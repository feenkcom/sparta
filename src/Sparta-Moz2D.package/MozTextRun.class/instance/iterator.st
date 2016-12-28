enumeration
iterator

	^ self is8Bit
		ifTrue: [ MozTextRunIterator8Bit on: self ]
		ifFalse: [ self is16Bit
			ifTrue: [ MozTextRunIterator16Bit on: self ]
			ifFalse: [ self is32Bit
				ifTrue: [ MozTextRunIterator32Bit on: self ]
				ifFalse: [ self error: 'Unknown UTF type: ', bits asString ] ] ]