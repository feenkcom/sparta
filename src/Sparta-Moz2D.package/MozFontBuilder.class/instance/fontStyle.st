private
fontStyle
	^ fontStyle ifNil: [ fontStyle := self createFontStyle ]