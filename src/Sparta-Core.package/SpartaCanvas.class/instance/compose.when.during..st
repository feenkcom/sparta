override
compose: aSymbol when: aWhenBlock during: aBlock
	"Force use a given composite operator during evaluation of aBlock
	if aWhenBlock evaluates to true"
	
	aWhenBlock value
		ifTrue: [ self compose: aSymbol during: aBlock ]
		ifFalse: [ aBlock value ]