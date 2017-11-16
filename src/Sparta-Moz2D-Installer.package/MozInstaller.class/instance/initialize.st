initialization
initialize
	super initialize.
	
	steps := OrderedCollection new.
	platform := Smalltalk platform mozLibraryInstaller new.
	beacon := Beacon new.
	
	self initializeSteps