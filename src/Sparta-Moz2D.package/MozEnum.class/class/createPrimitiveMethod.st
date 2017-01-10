test generation
createPrimitiveMethod
	(Smalltalk hasClassNamed: self testClassName)
		ifFalse: [ self testClassName asString, ' does not exist!' ].

	(Smalltalk classNamed: self testClassName) compile:
'valueNamed: aName in: anAddress
	^ self ffiCall: #(bool moz2d_test_' , self externalEnum asString, '(String aName, int* anAddress))'
	classified: 'private - ffi'