accessing
instances
	session == Smalltalk session
		ifFalse: [
			instances := nil.
			session := Smalltalk session ].

	^ instances ifNil: [ instances := WeakValueDictionary new ]