"
I am a special GLMBrick renderer for polygonal geometry
"
Class {
	#name : #SpartaGLMBrickVerticesRenderer,
	#superclass : #GLMBrickRenderer,
	#category : 'Sparta-Installer-UI'
}

{ #category : #rendering }
SpartaGLMBrickVerticesRenderer >> renderBackgroundColorOf: aBrick on: aCanvas in: aRectangle [

	aCanvas
		drawPolygon: (aBrick vertices collect: [ :each | each + aRectangle origin ])
		color: aBrick color
		borderWidth: 0
		borderColor: Color transparent
]
