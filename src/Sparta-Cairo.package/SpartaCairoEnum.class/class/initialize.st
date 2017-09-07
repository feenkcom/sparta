initialization
initialize

	"Skip initialization of root class"
	self = SpartaCairoEnum
		ifTrue: [ ^ self ].

	self initializeEnumeration.
	self rebuildEnumAccessors