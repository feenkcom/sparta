private - instance creation
createFontGroup
		
	^ (MozFontGroup
		from: self createFontList
		style: self createFontStyle)
			autoRelease;
			yourself