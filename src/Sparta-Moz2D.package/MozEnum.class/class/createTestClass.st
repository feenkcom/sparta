test generation
createTestClass

	"Test package is not loaded"
	(Smalltalk hasClassNamed: self testSuperclassName)
		ifFalse: [ ^ self error: self testSuperclassName asString, ' does not exist!' ].

	self testPackageName asPackageIfAbsent: [
		self error: self testPackageName asString, ' is not loaded!' ].

	(Smalltalk hasClassNamed: self testClassName)
		ifTrue: [ self testClassName asString, ' already exists!' ].

	(Smalltalk classNamed: self testSuperclassName) subclass: self testClassName
		instanceVariableNames: ''
		classVariableNames: ''
		package: self testPackageName