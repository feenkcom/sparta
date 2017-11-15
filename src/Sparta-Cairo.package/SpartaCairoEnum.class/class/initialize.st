initialization
initialize

	"Skip initialization of root class"
	self = SpartaCairoEnum
		ifTrue: [ ^ self ].

	self initializeEnumeration.
	Author
		useAuthor: 'UFFI'
		during: [ self rebuildEnumAccessors ]