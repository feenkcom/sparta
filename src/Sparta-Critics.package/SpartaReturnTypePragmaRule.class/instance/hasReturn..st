testing
hasReturn: aMethod
	^ (self areAllReturnsInheritanceRelated: (self nonSelfReturns: aMethod)) not