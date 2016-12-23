initialization
initialize
	super initialize.
	
	self
		signature: self class fnSpec
		block: self blockSpec.
	
	session := Smalltalk session