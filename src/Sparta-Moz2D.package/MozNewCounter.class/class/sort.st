mapping
sort
	dictionary := dictionary associations sort: [ :a :b | a value > b value ].
	dictionary do: [ :anAssociation |
		| theSortedAssociations |
		theSortedAssociations := anAssociation value value associations sort: [ :a :b | a value > b value ].
		anAssociation value value: theSortedAssociations asOrderedDictionary ].
	dictionary := dictionary asOrderedDictionary