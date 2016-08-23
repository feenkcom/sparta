drawing
maskPaint: aPaint
	
	self
		primMaskPattern: (source asMozPatternOn: canvas)
		mask: (aPaint asMozPatternOn: canvas)
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])