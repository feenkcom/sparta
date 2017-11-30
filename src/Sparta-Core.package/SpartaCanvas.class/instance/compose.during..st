override
compose: aSymbol during: aBlock
	"Force use a given composite operator during evaluation of aBlock"
	composeOperators push: aSymbol.
	self defaultDrawOptions perform: aSymbol.
	
	aBlock ensure: [
		composeOperators pop.
		composeOperators
			ifEmpty: [ self defaultDrawOptions composeOver ]
			ifNotEmpty: [ :theOperators | self defaultDrawOptions perform: theOperators top ] ]