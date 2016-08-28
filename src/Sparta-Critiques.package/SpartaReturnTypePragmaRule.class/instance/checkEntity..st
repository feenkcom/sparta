running
checkEntity: aMethod

	^ ((self hasReturn: aMethod)
			or: [ (self anyOverriddenMethodHasReturn: aMethod)
				or: [ self anyOverrideMethodHasReturn: aMethod ] ])
		and: [ (self doesNotHavePragma: aMethod) ]