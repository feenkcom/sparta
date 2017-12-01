initialization
initializeBrick
	| oopsBrick titleBrick |
	
	oopsBrick := GLMStringBrick new.
	oopsBrick text: 'Oops...'.
	oopsBrick textColor: Color gray.
	oopsBrick fontSize: 30.
	oopsBrick hAlign: #center.
	oopsBrick hShrinkWrap.
	
	titleBrick := GLMStringBrick new.
	titleBrick marginBottom: 10.
	titleBrick text: 'there is a problem with installation of Moz2D'.
	titleBrick textColor: Color gray.
	titleBrick fontSize: 10.
	titleBrick hAlign: #center.
	titleBrick hShrinkWrap.
	
	helpBrick := SpartaGLMRubPluggableTextBrick new.
	helpBrick withoutBorder.
	helpBrick withoutBackground.
	helpBrick hSpaceFill.
	helpBrick vSpaceFill.

	self addBrickBack: oopsBrick.
	self addBrickBack: titleBrick.
	self addBrickBack: helpBrick.