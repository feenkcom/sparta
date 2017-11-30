accessing
installer: anObject
	installerProgram := anObject.
	
	installerProgram when: #stepAdded send: #stepAdded to: self.
	
	self addAllBricks: (installerProgram steps collect: [ :aStep |
		self newStepItem installerStep: aStep ])