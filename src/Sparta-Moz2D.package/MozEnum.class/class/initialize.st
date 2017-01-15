class initialization
initialize
	
	"Skip initialization of root class"
	self = MozEnum
		ifTrue: [ ^ self ].

	self initializeEnumeration.
	representationType := self externalType.
	self initializeTest