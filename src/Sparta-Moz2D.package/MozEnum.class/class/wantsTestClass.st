test generation
wantsTestClass

	^ 	self ~= MozEnum and: [
			(Smalltalk hasClassNamed: self testSuperclassName) and: [ 
		 		(Smalltalk hasClassNamed: self testClassName) not and: [ 
					(self testPackageName asPackageIfAbsent: [ nil ]) isNotNil ] ] ]