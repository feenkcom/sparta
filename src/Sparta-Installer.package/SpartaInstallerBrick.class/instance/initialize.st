initialization
initialize
	super initialize.
	
	lastUpdate := 0.
	
	self hSpaceFill.
	self vSpaceFill.
	self useHorizontalLinearLayout.
	self color: Smalltalk ui theme backgroundColor.
	self padding: 4.
	self borderWidth: 4.
	self borderColor: Smalltalk ui theme borderColor