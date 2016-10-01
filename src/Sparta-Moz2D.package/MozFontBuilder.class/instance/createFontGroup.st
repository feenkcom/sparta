private - instance creation
createFontGroup
	
	self fontList isEmpty
		ifTrue: [ self sansSerif ].
	
	^ MozFontGroup
		from: self fontList
		style: self fontStyle