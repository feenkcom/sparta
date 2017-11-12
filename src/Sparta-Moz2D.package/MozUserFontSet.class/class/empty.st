instance creation
empty
	session == Smalltalk session
		ifFalse: [
			empty := nil.
			session := Smalltalk session ].

	^ empty ifNil: [ empty := self new ]