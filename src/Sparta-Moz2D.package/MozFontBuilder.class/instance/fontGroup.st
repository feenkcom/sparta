private
fontGroup
	^ fontGroup ifNil: [ fontGroup := self createFontGroup ]