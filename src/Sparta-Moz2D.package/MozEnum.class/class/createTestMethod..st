test generation
createTestMethod: anItemName
	(Smalltalk hasClassNamed: self testClassName)
		ifFalse: [ self testClassName asString, ' does not exist!' ].

	(Smalltalk classNamed: self testClassName) compile:
'test', anItemName asString, '
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum ', anItemName asString ,' item asString) value
		equals: self enum ', anItemName asString, ' value'
	classified: 'tests'