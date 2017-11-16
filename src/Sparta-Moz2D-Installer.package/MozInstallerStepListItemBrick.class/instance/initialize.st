initialization
initialize
	super initialize.
	
	self hSpaceFill.
	self useHorizontalLinearLayout.
	self paddingRight: 40.
	self paddingLeft: 20.
	self paddingTop: 10.
	self paddingBottom: 10.
	self height: 40.
	
	label := self newLabelBrick.
	label vAlign: #center.
	
	self addBrickBack: label