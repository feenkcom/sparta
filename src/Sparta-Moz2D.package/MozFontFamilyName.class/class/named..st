instance creation
named: aFontNameString
	"Default constructor. When printed will not have quotes around"
	^ self
		primCreateNamed: aFontNameString
		quoted: false