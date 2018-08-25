Class {
	#name : #SpartaCairoFillPainter,
	#superclass : #SpartaFillPainter,
	#traits : 'TSpartaCairoLibrary + TSpartaCairoContext',
	#classTraits : 'TSpartaCairoLibrary classTrait + TSpartaCairoContext classTrait',
	#category : 'Sparta-Cairo-Builders'
}

{ #category : #private }
SpartaCairoFillPainter >> applyDrawOptions [

	"draw options are not set, no need to apply them"
	drawOptions
		ifNil: [ ^ self ].
		
	self
		primSetAntialias: drawOptions antialias;
		primSetOperator: drawOptions operator
]

{ #category : #private }
SpartaCairoFillPainter >> fill [
	"Perform a fill operation according to global alpha property set in drawOptions"

	(drawOptions isNotNil and: [ drawOptions alpha ~= 1.0 ])
		"we have a custom global alpha mask"
		ifTrue: [ 
			self primSave.
			"restrict painted region to rectangle"
			self primClip.
			self primPaintAlpha: drawOptions alpha.
			self primRestore ]
		"fill normally"
		ifFalse: [ self primFill ].
	
	"do not forget to restore source to default"
	self primSetSourceR: 0.0 G: 0.0 B: 0.0 A: 1.0
]

{ #category : #drawing }
SpartaCairoFillPainter >> fillPath: aPath with: aBlock [

	self
		applyDrawOptions.

	aPath setOnCanvas: self canvas.
	
	aBlock value.
	self fill.

	self restoreDrawOptions
]

{ #category : #drawing }
SpartaCairoFillPainter >> fillPath: aPath withForm: aForm [
	| aSurface aSurfacePaint |
	
	aSurface := self canvas bitmap fromForm: aForm.
	aSurfacePaint := self canvas paint surface source: aSurface.
	
	self fillPath: aPath withSurface: aSurfacePaint
]

{ #category : #drawing }
SpartaCairoFillPainter >> fillPath: aPath withLinearGradient: aSpartaLinearGradient [

	self fillPath: aPath withPattern: aSpartaLinearGradient
]

{ #category : #drawing }
SpartaCairoFillPainter >> fillPath: aPath withPattern: aCairoPattern [

	self fillPath: aPath with: [ 
		self primSetSourcePattern: (aCairoPattern asSpartaCairoPatternOn: canvas) ]
]

{ #category : #drawing }
SpartaCairoFillPainter >> fillPath: aPath withRadialGradient: aSpartaRadialGradient [

	self fillPath: aPath withPattern: aSpartaRadialGradient
]

{ #category : #drawing }
SpartaCairoFillPainter >> fillPath: aPath withSolidColor: aColor [

	self fillPath: aPath with: [ 
		self primSetSourceR: aColor red G: aColor green B: aColor blue A: aColor alpha ]
]

{ #category : #drawing }
SpartaCairoFillPainter >> fillPath: aPath withSurface: aSpartaSurfacePaint [
	self fillPath: aPath withPattern: aSpartaSurfacePaint
]

{ #category : #drawing }
SpartaCairoFillPainter >> fillRectangle: aRectangle with: aBlock [ 

	self
		applyDrawOptions;
		primSetFillRule: SpartaCairoFillRule CAIRO_FILL_RULE_WINDING;
		primNewPath;
		primRectangleX: aRectangle left Y: aRectangle top width: aRectangle width height: aRectangle height.
	
	aBlock value.
	self fill.

	self restoreDrawOptions
]

{ #category : #drawing }
SpartaCairoFillPainter >> fillRectangle: aRectangle withForm: aForm [
	| aSurface aSurfacePaint |
	
	aSurface := self canvas bitmap fromForm: aForm.
	aSurfacePaint := self canvas paint surface source: aSurface.
	
	self fillRectangle: aRectangle withSurface: aSurfacePaint
]

{ #category : #drawing }
SpartaCairoFillPainter >> fillRectangle: aRectangle withLinearGradient: aSpartaLinearGradient [
	
	self fillRectangle: aRectangle withPattern: aSpartaLinearGradient
]

{ #category : #drawing }
SpartaCairoFillPainter >> fillRectangle: aRectangle withPattern: aCairoPattern [

	self fillRectangle: aRectangle with: [ 
		self primSetSourcePattern: (aCairoPattern asSpartaCairoPatternOn: canvas) ]
]

{ #category : #drawing }
SpartaCairoFillPainter >> fillRectangle: aRectangle withRadialGradient: aSpartaRadialGradient [
	
	self fillRectangle: aRectangle withPattern: aSpartaRadialGradient
]

{ #category : #drawing }
SpartaCairoFillPainter >> fillRectangle: aRectangle withSolidColor: aColor [
	
	self fillRectangle: aRectangle with: [ 
		self primSetSourceR: aColor red G: aColor green B: aColor blue A: aColor alpha ]
]

{ #category : #drawing }
SpartaCairoFillPainter >> fillRectangle: aRectangle withSurface: aSpartaSurfacePaint [
	self fillRectangle: aRectangle withPattern: aSpartaSurfacePaint
]

{ #category : #private }
SpartaCairoFillPainter >> restoreDrawOptions [

	"draw options are not set, no need to restore them"
	drawOptions
		ifNil: [ ^ self ].
		
	self
		primSetAntialias: canvas defaultDrawOptions antialias;
		primSetOperator: canvas defaultDrawOptions operator
]
