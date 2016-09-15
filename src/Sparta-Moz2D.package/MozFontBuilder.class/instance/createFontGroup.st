private - instance creation
createFontGroup

	^ MozFontGroup
		from: self fontList
		style: self fontStyle