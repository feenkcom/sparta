accessing
dashPattern
	<return: #Array of: #Number>

	(self privateDashLength isZero or: [ self privateDashPattern isNull ])
		ifTrue: [ ^ #() ].

	^ (FFIExternalArray
		fromHandle: self privateDashPattern getHandle
		type: 'float'
		size: self privateDashLength) asArray