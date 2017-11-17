drawing-support
translateBy: delta during: aBlock
	"Set a translation only during the execution of aBlock."
	
	self canvas transform
		during: [ :aTransform |
			aTransform translateBy: delta.
			aTransform apply.
			aBlock value: self ]