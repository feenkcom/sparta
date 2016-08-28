private
areAllReturnsInheritanceRelated: anArrayOfRBReturnNodes
	^ anArrayOfRBReturnNodes
		allSatisfy: [ :return | return value isMessage and: [ self inheritanceMessages includes: return value selector  ] ]