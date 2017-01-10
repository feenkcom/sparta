test generation
createEnumMethod
	(Smalltalk hasClassNamed: self testClassName)
		ifFalse: [ self testClassName asString, ' does not exist!' ].

	(Smalltalk classNamed: self testClassName) compile:
'enum
	^ ', self name asString
	classified: 'accessing'