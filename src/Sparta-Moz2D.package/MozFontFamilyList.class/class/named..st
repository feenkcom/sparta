instance creation
named: aFontNameString

	^ (self
		primCreateNamed: aFontNameString
		quoted: false)
			autoRelease;
			yourself