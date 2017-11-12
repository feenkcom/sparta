private - instance creation
createFontGroup
		
	^ (MozFontGroup
		from: self createFontList
		userFontSet: self canvas fontFace userFontSet
		style: self createFontStyle)
			autoRelease;
			yourself