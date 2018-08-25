Class {
	#name : #SpartaCairoStrokePainter,
	#superclass : #SpartaStrokePainter,
	#traits : 'TSpartaCairoLibrary + TSpartaCairoContext',
	#classTraits : 'TSpartaCairoLibrary classTrait + TSpartaCairoContext classTrait',
	#category : 'Sparta-Cairo-Builders'
}

{ #category : #private }
SpartaCairoStrokePainter >> applyDrawOptions [

	"draw options are not set, no need to apply them"
	drawOptions
		ifNil: [ ^ self ].
		
	self
		primSetAntialias: drawOptions antialias;
		primSetOperator: drawOptions operator
]

{ #category : #private }
SpartaCairoStrokePainter >> applyStrokeOptions [
	| theDashes |
	
	"stroke options are not set, no need to apply them"
	strokeOptions
		ifNil: [ ^ self ].
		
	self
		primSetLineWidth: strokeOptions width;
		primSetLineCap: strokeOptions lineCap;
		primSetLineJoin: strokeOptions lineJoin;
		primSetMiterLimit: strokeOptions miterLimit.
		
	theDashes := FFIExternalArray newType: 'double' size: strokeOptions dashPattern size.
	theDashes atAll: (1 to: strokeOptions dashPattern size) putAll: strokeOptions dashPattern.
	
	self primSetDashes: theDashes getHandle count: strokeOptions dashPattern size offset: strokeOptions dashOffset
]

{ #category : #private }
SpartaCairoStrokePainter >> restoreDrawOptions [

	"draw options are not set, no need to restore them"
	drawOptions
		ifNil: [ ^ self ].
		
	self
		primSetAntialias: canvas defaultDrawOptions antialias;
		primSetOperator: canvas defaultDrawOptions operator
]

{ #category : #private }
SpartaCairoStrokePainter >> restoreStrokeOptions [
	| theDashes aStrokeOptions |
	
	"stroke options are not set, no need to restore them"
	strokeOptions
		ifNil: [ ^ self ].
	
	aStrokeOptions := canvas defaultStrokeOptions.
	
	self
		primSetLineWidth: aStrokeOptions width;
		primSetLineCap: aStrokeOptions lineCap;
		primSetLineJoin: aStrokeOptions lineJoin;
		primSetMiterLimit: aStrokeOptions miterLimit.
		
	theDashes := FFIExternalArray newType: 'double' size: aStrokeOptions dashPattern size.
	theDashes atAll: (1 to: aStrokeOptions dashPattern size) putAll: aStrokeOptions dashPattern.
	
	self primSetDashes: theDashes getHandle count: aStrokeOptions dashPattern size offset: aStrokeOptions dashOffset
		
	
]

{ #category : #private }
SpartaCairoStrokePainter >> stroke [
	"Perform a stroke operation"

	self primStroke.
	"do not forget to restore source to default"
	self primSetSourceR: 0.0 G: 0.0 B: 0.0 A: 1.0
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokeLine: aLine with: aBlock [ 

	self
		applyDrawOptions;
		applyStrokeOptions;
		primSetFillRule: SpartaCairoFillRule CAIRO_FILL_RULE_WINDING;
		primNewPath;
		primMoveToX: aLine from x Y: aLine from y;
		primLineToX: aLine to x Y: aLine to y.

	aBlock value.
	self stroke.

	self restoreStrokeOptions.
	self restoreDrawOptions
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokeLine: aLine withLinearGradient: aSpartaLinearGradient [

	self strokeLine: aLine withPattern: aSpartaLinearGradient
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokeLine: aLine withPattern: aCairoPattern [

	self strokeLine: aLine with: [ 
		self primSetSourcePattern: (aCairoPattern asSpartaCairoPatternOn: canvas) ]
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokeLine: aLine withRadialGradient: aSpartaRadialGradient [

	self strokeLine: aLine withPattern: aSpartaRadialGradient
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokeLine: aLine withSolidColor: aColor [

	self strokeLine: aLine with: [ 
		self primSetSourceR: aColor red G: aColor green B: aColor blue A: aColor alpha ]
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokeLine: aLine withSurface: aSpartaSurfacePaint [
	self strokeLine: aLine withPattern: aSpartaSurfacePaint
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokePath: aPath with: aBlock [

	self
		applyDrawOptions;
		applyStrokeOptions.
		
	aPath setOnCanvas: self canvas.
	
	aBlock value.
	self stroke.
	
	self restoreStrokeOptions.
	self restoreDrawOptions
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokePath: aPath withForm: aForm [
	| aSurface aSurfacePaint |
	
	aSurface := self canvas bitmap fromForm: aForm.
	aSurfacePaint := self canvas paint surface source: aSurface.
	
	self strokePath: aPath withSurface: aSurfacePaint
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokePath: aPath withLinearGradient: aSpartaLinearGradient [

	self strokePath: aPath withPattern: aSpartaLinearGradient
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokePath: aPath withPattern: aCairoPattern [

	self strokePath: aPath with: [ 
		self primSetSourcePattern: (aCairoPattern asSpartaCairoPatternOn: canvas) ]
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokePath: aPath withRadialGradient: aSpartaRadialGradient [

	self strokePath: aPath withPattern: aSpartaRadialGradient
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokePath: aPath withSolidColor: aColor [

	self strokePath: aPath with: [ 
		self primSetSourceR: aColor red G: aColor green B: aColor blue A: aColor alpha ]
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokePath: aPath withSurface: aSpartaSurfacePaint [
	self strokePath: aPath withPattern: aSpartaSurfacePaint
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokeRectangle: aRectangle with: aBlock [ 

	self
		applyDrawOptions;
		applyStrokeOptions;
		primSetFillRule: SpartaCairoFillRule CAIRO_FILL_RULE_WINDING;
		primNewPath;
		primRectangleX: aRectangle left Y: aRectangle top width: aRectangle width height: aRectangle height.
	
	aBlock value.
	self stroke.

	self restoreStrokeOptions.
	self restoreDrawOptions
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokeRectangle: aRectangle withForm: aForm [
	| aSurface aSurfacePaint |
	
	aSurface := self canvas bitmap fromForm: aForm.
	aSurfacePaint := self canvas paint surface source: aSurface.
	
	self strokeRectangle: aRectangle withSurface: aSurfacePaint
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokeRectangle: aRectangle withLinearGradient: aSpartaLinearGradient [
	
	self strokeRectangle: aRectangle withPattern: aSpartaLinearGradient
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokeRectangle: aRectangle withPattern: aCairoPattern [

	self strokeRectangle: aRectangle with: [ 
		self primSetSourcePattern: (aCairoPattern asSpartaCairoPatternOn: canvas) ]
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokeRectangle: aRectangle withRadialGradient: aSpartaRadialGradient [
	
	self strokeRectangle: aRectangle withPattern: aSpartaRadialGradient
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokeRectangle: aRectangle withSolidColor: aColor [

	self strokeRectangle: aRectangle with: [ 
		self primSetSourceR: aColor red G: aColor green B: aColor blue A: aColor alpha ]
]

{ #category : #drawing }
SpartaCairoStrokePainter >> strokeRectangle: aRectangle withSurface: aSpartaSurfacePaint [
	self strokeRectangle: aRectangle withPattern: aSpartaSurfacePaint
]
