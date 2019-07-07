Class {
	#name : #MozFillPainter,
	#superclass : #SpartaFillPainter,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#category : 'Sparta-Moz2D-Builders'
}

{ #category : #drawing }
MozFillPainter >> fillPath: aPath withForm: aForm [
	| form |

	form := aForm unhibernate; asFormOfDepth: 32.
	self
		primFillPath: aPath
		bits: form bits
		formWidth: form width
		formHeight: form height
		stride: form stride
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #drawing }
MozFillPainter >> fillPath: aPath withLinearGradient: aSpartaLinearGradient [
	"spartaFillOn:with: -> fillPath: -> spartaFillPath:with: -> fillPath:withLinearGradient:"
	
	self fillPath: aPath withPattern: aSpartaLinearGradient
]

{ #category : #drawing }
MozFillPainter >> fillPath: aPath withPattern: aMozPattern [

	self
		primFillPath: aPath
		pattern: (aMozPattern asMozPatternOn: canvas)
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #drawing }
MozFillPainter >> fillPath: aPath withRadialGradient: aSpartaRadialGradient [

	self fillPath: aPath withPattern: aSpartaRadialGradient
]

{ #category : #drawing }
MozFillPainter >> fillPath: aPath withSolidColor: aColor [
	self
		primFillPathColor: aPath
		r: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #drawing }
MozFillPainter >> fillPath: aPath withSurface: aSpartaSurfacePaint [
	| anOrigin |
	anOrigin := (aPath strokedBoundsOn: self canvas with: MozStrokeOptions default) origin.
	aSpartaSurfacePaint translateBy: anOrigin.
	self fillPath: aPath withPattern: aSpartaSurfacePaint.
	aSpartaSurfacePaint translateBy: anOrigin negated
]

{ #category : #drawing }
MozFillPainter >> fillRectangle: aRectangle withForm: aForm [
	| form |

	form := aForm unhibernate; asFormOfDepth: 32.
	self
		primFillX: aRectangle left
		y: aRectangle top
		width: aRectangle width
		height: aRectangle height
		bits: form bits
		formWidth: form width
		formHeight: form height
		stride: form stride
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #drawing }
MozFillPainter >> fillRectangle: aRectangle withLinearGradient: aSpartaLinearGradient [
	
	self fillRectangle: aRectangle withPattern: aSpartaLinearGradient
]

{ #category : #drawing }
MozFillPainter >> fillRectangle: aRectangle withPattern: aMozPattern [

	self
		primFillRect: (MozNativeRect fromRectangle: aRectangle)
		pattern: (aMozPattern asMozPatternOn: canvas)
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #drawing }
MozFillPainter >> fillRectangle: aRectangle withRadialGradient: aSpartaRadialGradient [
	
	self fillRectangle: aRectangle withPattern: aSpartaRadialGradient
]

{ #category : #drawing }
MozFillPainter >> fillRectangle: aRectangle withSolidColor: aColor [

	[ self
		primFillX: aRectangle left
		y: aRectangle top
		width: aRectangle width
		height: aRectangle height
		r: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha 
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ]) ]
			on: Error do: [
				| aMessage |
				
				aMessage := 'Unable to fill rectangle: {1} with {2}' format: { aRectangle . aColor }.
				Notification signal: aMessage.
				
				NonInteractiveTranscript stderr
					show: aMessage;
					cr ]
]

{ #category : #drawing }
MozFillPainter >> fillRectangle: aRectangle withSurface: aSpartaSurfacePaint [
	| aPattern |
	aSpartaSurfacePaint translateBy: aRectangle origin.
	
	aPattern := canvas pattern surface: aSpartaSurfacePaint.
	self fillRectangle: aRectangle withPattern: aPattern.
	aPattern release.

	aSpartaSurfacePaint translateBy: aRectangle origin negated
]

{ #category : #'private - ffi' }
MozFillPainter >> primFillPath: aMozPath bits: aData formWidth: aFormWidth formHeight: aFormHeight stride: aStride drawOptions: aMozDrawOptions [

	^ self ffiCall: #( void moz2d_draw_target_fill_path_form (
		MozCanvas canvas,
		MozPath aMozPath,
		MozDrawOptions aMozDrawOptions,
		void* aData,
		int32 aFormWidth,
		int32 aFormHeight,
		int32 aStride) )
]

{ #category : #'private - ffi' }
MozFillPainter >> primFillPath: aMozPath pattern: aMozPattern drawOptions: aMozDrawOptions [

	^ self ffiCall: #( void moz2d_draw_target_fill_path (
		MozCanvas canvas,
		MozPath aMozPath,
		MozNativePattern aMozPattern,
		MozDrawOptions aMozDrawOptions ) )
]

{ #category : #'private - ffi' }
MozFillPainter >> primFillPathColor: aMozPath r: r g: g b: b a: a drawOptions: aMozDrawOptions [

	^ self ffiCall: #( void moz2d_draw_target_fill_path_color (
		MozCanvas canvas,
		MozPath aMozPath,
		float r,
		float g,
		float b,
		float a,
		MozDrawOptions aMozDrawOptions ) )
]

{ #category : #'private - ffi' }
MozFillPainter >> primFillRect: aMoz2DRectangle pattern: aMoz2DPattern drawOptions: aMoz2DDrawOptions [

	^ self ffiCall: #( void moz2d_draw_target_fill_rect (
		MozCanvas canvas,
		MozNativeRect aMoz2DRectangle,
		MozNativePattern aMoz2DPattern,
		MozDrawOptions aMoz2DDrawOptions ) )
]

{ #category : #'private - ffi' }
MozFillPainter >> primFillX: x y: y width: width height: height bits: aData formWidth: aFormWidth formHeight: aFormHeight stride: aStride drawOptions: aMoz2DDrawOptions [
		
	^ self ffiCall: #( void moz2d_draw_target_fill_rectangle_form (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height,
		MozDrawOptions aMoz2DDrawOptions,
		void* aData,
		int32 aFormWidth,
		int32 aFormHeight,
		int32 aStride) )
]

{ #category : #'private - ffi' }
MozFillPainter >> primFillX: x y: y width: width height: height r: r g: g b: b a: a drawOptions: aMoz2DDrawOptions [

	^ self ffiCall: #( void moz2d_draw_target_fill_rect_color (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height,
		float r,
		float g,
		float b,
		float a,
		MozDrawOptions aMoz2DDrawOptions ) )
]
