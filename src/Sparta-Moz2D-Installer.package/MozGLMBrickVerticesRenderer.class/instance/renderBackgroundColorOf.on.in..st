rendering
renderBackgroundColorOf: aBrick on: aCanvas in: aRectangle

	aCanvas
		drawPolygon: (aBrick vertices collect: [ :each | each + aRectangle origin ])
		color: aBrick color
		borderWidth: 0
		borderColor: Color transparent