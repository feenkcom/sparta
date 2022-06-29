Class {
	#name : #SpartaCairoPaint,
	#superclass : #Object,
	#traits : 'TSpartaPaint + TSpartaTransformable + TSpartaInspectorPreview',
	#classTraits : 'TSpartaPaint classTrait + TSpartaTransformable classTrait + TSpartaInspectorPreview classTrait',
	#instVars : [
		'matrix',
		'extendMode'
	],
	#category : #'Sparta-Cairo-Paints'
}

{ #category : #converting }
SpartaCairoPaint >> asForm [
	| aCanvas |

	aCanvas := SpartaCairoCanvas checker: self formExtent.
	aCanvas fill
		paint: self;
		path: aCanvas bounds;
		draw.

	^ aCanvas asForm
]

{ #category : #converting }
SpartaCairoPaint >> asSpartaPaintOn: aSpartaCanvas [
	^ self
]

{ #category : #'extend modes' }
SpartaCairoPaint >> clamp [
	"Do not repeat"
	self extendMode: SpartaCairoExtendMode CAIRO_EXTEND_NONE
]

{ #category : #'extend modes' }
SpartaCairoPaint >> extendMode [
	^ extendMode
]

{ #category : #'extend modes' }
SpartaCairoPaint >> extendMode: anExtendMode [
	extendMode := anExtendMode
]

{ #category : #converting }
SpartaCairoPaint >> formExtent [
	^ self subclassResponsibility
]

{ #category : #initialization }
SpartaCairoPaint >> initialize [
	super initialize.
	
	matrix := SpartaMatrix new.
	self clamp
]

{ #category : #'api - transformations' }
SpartaCairoPaint >> multiplyBy: aMatrix [
	aMatrix spartaMultiplyWith: self transformation
]

{ #category : #'extend modes' }
SpartaCairoPaint >> reflect [
	"Mirror the image"
	self extendMode: SpartaCairoExtendMode CAIRO_EXTEND_REFLECT
]

{ #category : #'extend modes' }
SpartaCairoPaint >> repeat [
	"Repeat in both axis"
	self extendMode: SpartaCairoExtendMode CAIRO_EXTEND_REPEAT
]

{ #category : #'extend modes' }
SpartaCairoPaint >> repeatX [
	"Only X axis"
	SpartaUnsupported signal
]

{ #category : #'extend modes' }
SpartaCairoPaint >> repeatY [
	"Only Y axis"
	SpartaUnsupported signal
]

{ #category : #'api - transformations' }
SpartaCairoPaint >> rotateByDegrees: angle [

	self transformation rotateByDegrees: angle
]

{ #category : #'api - transformations' }
SpartaCairoPaint >> rotateByRadians: angle [

	self transformation rotateByRadians: angle
]

{ #category : #'api - transformations' }
SpartaCairoPaint >> scaleBy: aPointOrNumber [

	self transformation scaleBy: aPointOrNumber
]

{ #category : #'api - transformations' }
SpartaCairoPaint >> scaleX: aX Y: aY [

	self transformation scaleX: aX Y: aY
]

{ #category : #dispatch }
SpartaCairoPaint >> spartaFillString: aString with: aTextPainter [
	aTextPainter fillString: aString withPaint: self
]

{ #category : #dispatch }
SpartaCairoPaint >> spartaFillTextRun: aTextRun with: aTextPainter [
	aTextPainter fillTextRun: aTextRun withPaint: self
]

{ #category : #dispatch }
SpartaCairoPaint >> spartaMaskOn: aSpartaCanvas with: aMaskPainter [
	aMaskPainter maskPaint: self
]

{ #category : #dispatch }
SpartaCairoPaint >> spartaStrokeString: aString fillColor: aFillColor with: aTextPainter [
	aTextPainter fillString: aString withColor: aFillColor strokePaint: self
]

{ #category : #dispatch }
SpartaCairoPaint >> spartaStrokeString: aString fillPaint: aFillPaint with: aTextPainter [
	aTextPainter fillString: aString withPaint: aFillPaint strokePaint: self
]

{ #category : #dispatch }
SpartaCairoPaint >> spartaStrokeTextRun: aTextRun fillColor: aFillColor with: aTextPainter [
	aTextPainter fillTextRun: aTextRun withColor: aFillColor strokePaint: self
]

{ #category : #dispatch }
SpartaCairoPaint >> spartaStrokeTextRun: aTextRun fillPaint: aFillPaint with: aTextPainter [
	aTextPainter fillTextRun: aTextRun withPaint: aFillPaint strokePaint: self
]

{ #category : #accessing }
SpartaCairoPaint >> transformation [
	^ matrix
]

{ #category : #accessing }
SpartaCairoPaint >> transformation: aMatrix [
	matrix := aMatrix
]

{ #category : #'api - transformations' }
SpartaCairoPaint >> translateBy: aPointOrNumber [

	self transformation translateBy: aPointOrNumber asPoint
]

{ #category : #'api - transformations' }
SpartaCairoPaint >> translateX: aX Y: aY [

	self transformation translateX: aX Y: aY
]
