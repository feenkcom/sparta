private
itemNamed: aName
	| value success type |
	
	type := (self enum representationType externalType isSigned
		ifTrue: [ FFIInt32 ]
		ifFalse: [ FFIUInt32 ]) new.
	
	value := ByteArray new: type externalTypeSize.
	success := self valueNamed: aName in: value.

	success
		ifFalse: [ self fail: aName asString, ' does not exist in external ', self enum asString, '!' ].

	^ self enum fromInteger: (type handle: value at: 1)