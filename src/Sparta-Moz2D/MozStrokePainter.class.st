Class {
	#name : #MozStrokePainter,
	#superclass : #SpartaStrokePainter,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#category : 'Sparta-Moz2D-Builders'
}

{ #category : #'library path' }
MozStrokePainter class >> ffiLibraryName [
	^ MozLibrary
]

{ #category : #private }
MozStrokePainter >> primStrokeLineFromX: fromX fromY: fromY toX: toX toY: toY pattern: aMozPattern strokeOptions: aMozStrokeOptions drawOptions: aMozDrawOptions [

	^ self ffiCall: #( void moz2d_draw_target_stroke_line (
		MozCanvas canvas,
		float fromX,
		float fromY,
		float toX,
		float toY,
		MozNativePattern aMozPattern,
		MozStrokeOptions aMozStrokeOptions,
		MozDrawOptions aMozDrawOptions ) )
]

{ #category : #private }
MozStrokePainter >> primStrokeLineFromX: fromX fromY: fromY toX: toX toY: toY r: r g: g b: b a: a strokeOptions: aMozStrokeOptions drawOptions: aMozDrawOptions [

	^ self ffiCall: #( void moz2d_draw_target_stroke_line_color (
		MozCanvas canvas,
		float fromX,
		float fromY,
		float toX,
		float toY,
		float r,
		float g,
		float b,
		float a,
		MozStrokeOptions aMozStrokeOptions,
		MozDrawOptions aMozDrawOptions ) )
]

{ #category : #private }
MozStrokePainter >> primStrokePath: aMozPath pattern: aMozPattern strokeOptions: aMozStrokeOptions drawOptions: aMozDrawOptions [

	^ self ffiCall: #( void moz2d_draw_target_stroke_path (
		MozCanvas canvas,
		MozPath aMozPath,
		MozNativePattern aMozPattern,
		MozStrokeOptions aMozStrokeOptions,
		MozDrawOptions aMozDrawOptions ) )
]

{ #category : #private }
MozStrokePainter >> primStrokePath: aMozPath r: r g: g b: b a: a strokeOptions: aMozStrokeOptions drawOptions: aMozDrawOptions [

	^ self ffiCall: #( void moz2d_draw_target_stroke_path_color (
		MozCanvas canvas,
		MozPath aMozPath,
		float r,
		float g,
		float b,
		float a,
		MozStrokeOptions aMozStrokeOptions,
		MozDrawOptions aMozDrawOptions ) )
]

{ #category : #private }
MozStrokePainter >> primStrokeRect: aMozRectangle pattern: aMozPattern strokeOptions: aMozStrokeOptions drawOptions: aMozDrawOptions [

	^ self ffiCall: #( void moz2d_draw_target_stroke_rect (
		MozCanvas canvas,
		MozNativeRect aMozRectangle,
		MozNativePattern aMozPattern,
		MozStrokeOptions aMozStrokeOptions,
		MozDrawOptions aMozDrawOptions ) )
]

{ #category : #private }
MozStrokePainter >> primStrokeX: x y: y width: width height: height r: r g: g b: b a: a strokeOptions: aMozStrokeOptions drawOptions: aMozDrawOptions [

	^ self ffiCall: #( void moz2d_draw_target_stroke_rect_color (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height,
		float r,
		float g,
		float b,
		float a,
		MozStrokeOptions aMozStrokeOptions,
		MozDrawOptions aMozDrawOptions ) )
]

{ #category : #drawing }
MozStrokePainter >> strokeLine: aLine withLinearGradient: aSpartaLinearGradient [
	
	self strokeLine: aLine withPattern: aSpartaLinearGradient
]

{ #category : #drawing }
MozStrokePainter >> strokeLine: aLine withPattern: aMozPattern [
	self
		primStrokeLineFromX: aLine from x
		fromY: aLine from y
		toX: aLine to x
		toY: aLine to y
		pattern: (aMozPattern asMozPatternOn: canvas)
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #drawing }
MozStrokePainter >> strokeLine: aLine withRadialGradient: aSpartaRadialGradient [
	
	self strokeLine: aLine withPattern: aSpartaRadialGradient
]

{ #category : #drawing }
MozStrokePainter >> strokeLine: aLine withSolidColor: aColor [
	self
		primStrokeLineFromX: aLine from x
		fromY: aLine from y
		toX: aLine to x
		toY: aLine to y
		r: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #drawing }
MozStrokePainter >> strokeLine: aLine withSurface: aSpartaSurfacePaint [
	
	self strokeLine: aLine withPattern: aSpartaSurfacePaint
]

{ #category : #drawing }
MozStrokePainter >> strokePath: aPath withLinearGradient: aSpartaLinearGradient [

	self
		primStrokePath: aPath
		pattern: (aSpartaLinearGradient asMozPatternOn: canvas)
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #drawing }
MozStrokePainter >> strokePath: aPath withRadialGradient: aSpartaRadialGradient [
	
	self
		primStrokePath: aPath
		pattern: (aSpartaRadialGradient asMozPatternOn: canvas)
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #drawing }
MozStrokePainter >> strokePath: aPath withSolidColor: aColor [
	self
		primStrokePath: aPath
		r: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #drawing }
MozStrokePainter >> strokePath: aPath withSurface: aSpartaSurfacePaint [
	self
		primStrokePath: aPath
		pattern: (aSpartaSurfacePaint asMozPatternOn: canvas)
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #drawing }
MozStrokePainter >> strokeRectangle: aRectangle withLinearGradient: aSpartaLinearGradient [
	self
		primStrokeRect: (MozNativeRect fromRectangle: aRectangle)
		pattern: (aSpartaLinearGradient asMozPatternOn: canvas)
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #drawing }
MozStrokePainter >> strokeRectangle: aRectangle withRadialGradient: aSpartaRadialGradient [
	self
		primStrokeRect: (MozNativeRect fromRectangle: aRectangle)
		pattern: (aSpartaRadialGradient asMozPatternOn: canvas)
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #drawing }
MozStrokePainter >> strokeRectangle: aRectangle withSolidColor: aColor [
	self
		primStrokeX: aRectangle left
		y: aRectangle top
		width: aRectangle width 
		height: aRectangle height
		r: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #drawing }
MozStrokePainter >> strokeRectangle: aRectangle withSurface: aSpartaSurfacePaint [
	self
		primStrokeRect: (MozNativeRect fromRectangle: aRectangle)
		pattern: (aSpartaSurfacePaint asMozPatternOn: canvas)
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]
