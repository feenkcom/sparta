accessing
cache

	session == Smalltalk session
		ifFalse: [
			cache := nil.
			session := Smalltalk session ].

	^ cache ifNil: [ cache := self defaultCache ]