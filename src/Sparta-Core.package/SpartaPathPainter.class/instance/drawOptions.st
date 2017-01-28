accessing
drawOptions
	^ drawOptions ifNil: [ drawOptions := canvas drawOptions ]