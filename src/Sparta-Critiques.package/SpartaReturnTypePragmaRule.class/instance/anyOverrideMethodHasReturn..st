testing
anyOverrideMethodHasReturn: aMethod

	^ (self overrideMethods: aMethod) anySatisfy: [ :each | self hasReturn: each ]