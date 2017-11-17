accessing
drawOptions
	^ drawOptions ifNil: [
		sharedDrawOptions ifNotNil: #reset.
		sharedDrawOptions ifNil: [ sharedDrawOptions := self canvas drawOptions ].
		drawOptions := sharedDrawOptions.
		drawOptions ]