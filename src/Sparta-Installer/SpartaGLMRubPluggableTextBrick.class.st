"
I wrap RubPluggableTextMorph and allow it to be embedded in Morphic-Brick
"
Class {
	#name : #SpartaGLMRubPluggableTextBrick,
	#superclass : #GLMRubScrolledTextBrick,
	#category : 'Sparta-Installer-UI'
}

{ #category : #'change reporting' }
SpartaGLMRubPluggableTextBrick >> invalidRect: aRectangle from: aMorph [
	aMorph == self
		ifTrue: [ super invalidRect: aRectangle from: aMorph ]
		ifFalse: [ self changed ]
]

{ #category : #'instance creation' }
SpartaGLMRubPluggableTextBrick >> newRubricMorph [
	^ RubPluggableTextMorph new beWrapped
]
