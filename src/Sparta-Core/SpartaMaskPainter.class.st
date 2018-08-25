Class {
	#name : #SpartaMaskPainter,
	#superclass : #SpartaAbstractPainter,
	#instVars : [
		'drawOptions',
		'source',
		'mask',
		'offset'
	],
	#category : 'Sparta-Core-Builders'
}

{ #category : #drawing }
SpartaMaskPainter >> draw [
	mask spartaMaskOn: canvas with: self
]

{ #category : #accessing }
SpartaMaskPainter >> drawOptions: aDrawOptions [

	drawOptions := aDrawOptions
]

{ #category : #accessing }
SpartaMaskPainter >> mask: aMask [
	
	mask := aMask
]

{ #category : #drawing }
SpartaMaskPainter >> maskPaint: aPaint [

	^ self subclassResponsibility
]

{ #category : #drawing }
SpartaMaskPainter >> maskSurface: aSurface [

	^ self subclassResponsibility
]

{ #category : #accessing }
SpartaMaskPainter >> offset: aPoint [

	offset := aPoint
]

{ #category : #'initialize-release' }
SpartaMaskPainter >> reset [
	super reset.
	
	drawOptions := nil.
	offset := nil.
	source := nil.
	mask := nil.
]

{ #category : #accessing }
SpartaMaskPainter >> source: aSourcePattern [

	source := aSourcePattern
]
