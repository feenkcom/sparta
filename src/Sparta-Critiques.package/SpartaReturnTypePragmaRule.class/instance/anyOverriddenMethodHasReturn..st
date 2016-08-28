testing
anyOverriddenMethodHasReturn: aMethod
	
	^ (self overriddenMethods: aMethod)
		anySatisfy: [ :each | self hasReturn: each ]