instance creation
drawOptions
	^ self class drawOptions new
		in: [ :aDrawOptions | composeOperators ifNotEmpty: [ :theOperators | aDrawOptions perform: theOperators top ] ];
		yourself