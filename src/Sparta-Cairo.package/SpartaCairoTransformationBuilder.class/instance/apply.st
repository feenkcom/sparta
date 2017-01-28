transformation
apply
	
	transformation isIdentity
		ifTrue: [ ^ self ].

	self primApplyTransform: (SpartaCairoMatrix fromSpartaMatrix: transformation)