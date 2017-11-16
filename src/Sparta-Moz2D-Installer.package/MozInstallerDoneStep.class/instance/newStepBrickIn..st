instance creation
newStepBrickIn: anInstaller
	^ GLMStringBrick new
		text: 'Done!';
		fontSize: 20;
		textColor: Color gray;
		hAlign: #center;
		vAlign: #center;
		hShrinkWrap;
		vSpaceFill;
		yourself