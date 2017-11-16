initialization
initializeBricks
	| aLogoContainer aSpartaLabel aStepList aListContainer aSpartaLogo |
	self
		assert: [ installer isNotNil ]
		description: [ 'Program must not be nil' ].

	aSpartaLogo := GLMActionButtonBrick new.
	aSpartaLogo icon: (SpartaCanvas logo scaledToSize: 50@50).
	aSpartaLogo vShrinkWrap.

	aSpartaLabel := GLMLabelBrick new.
	aSpartaLabel text: 'Sparta / Moz2D'.
	aSpartaLabel vAlign: #center.
	aSpartaLabel fontSize: 15. 
	aSpartaLabel hSpaceFill.
	aSpartaLabel vShrinkWrap.

	aLogoContainer := GLMBrick new.
	aLogoContainer useHorizontalLinearLayout.
	aLogoContainer hSpaceFill.
	aLogoContainer vShrinkWrap.
	aLogoContainer padding: 5.

	aLogoContainer addAllBricks: { aSpartaLogo . aSpartaLabel }.

	aStepList := self newStepList.
	aStepList installer: self installer.
	aStepList hSpaceFill: 90.
	aStepList vSpaceFill.

	aListContainer := GLMBandBrick new.
	aListContainer width: 250.
	aListContainer vSpaceFill.
	aListContainer zIndex: 2.

	aListContainer addAllBricks: { aLogoContainer . aStepList }.

	stepBrick := self newStepBrick.
	stepBrick useHorizontalLinearLayout.
	stepBrick hSpaceFill.
	stepBrick vSpaceFill.
	stepBrick marginLeft: -40.
	stepBrick paddingLeft: 40.
	
	self addAllBricks: { aListContainer . stepBrick }