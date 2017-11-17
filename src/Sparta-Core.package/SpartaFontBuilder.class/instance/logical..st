initialization
logical: aLogicalFont
	| aCanvas |
	"Initialize a font from a given logical font resetting all previous settings"
	
	aCanvas := self canvas.
	self reset.
	self canvas: aCanvas.
	
	self named: aLogicalFont familyName.
	self weight: aLogicalFont weightValue.
	self style: aLogicalFont slantValue.
	self stretch: aLogicalFont stretchValue.
	self size: aLogicalFont pixelSize