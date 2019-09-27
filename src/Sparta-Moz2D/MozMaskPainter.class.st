Class {
	#name : #MozMaskPainter,
	#superclass : #SpartaMaskPainter,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#category : 'Sparta-Moz2D-Builders'
}

{ #category : #'library path' }
MozMaskPainter class >> ffiLibraryName [
	^ MozLibrary
]

{ #category : #drawing }
MozMaskPainter >> maskPaint: aPaint [
	
	self
		primMaskPattern: (source asMozPatternOn: canvas)
		mask: (aPaint asMozPatternOn: canvas)
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #drawing }
MozMaskPainter >> maskSurface: aSurface [
		
	self
		primMaskSurface: ((source asSpartaPaintOn: canvas) asMozPatternOn: canvas)
		mask: aSurface
		offsetX: (offset ifNil: 0 ifNotNil: #x)
		offsetY: (offset ifNil: 0 ifNotNil: #y)
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #'private - ffi' }
MozMaskPainter >> primMaskPattern: aSourcePattern mask: aMaskPattern drawOptions: aMoz2DDrawOptions [

	^ self ffiCall: #( void moz2d_draw_target_mask_pattern (
		MozCanvas canvas,
		MozNativePattern aSourcePattern,
		MozNativePattern aMaskPattern,
		MozDrawOptions aMoz2DDrawOptions ) )
]

{ #category : #'private - ffi' }
MozMaskPainter >> primMaskSurface: aSourcePattern mask: aMaskSurface offsetX: offsetX offsetY: offsetY drawOptions: aMoz2DDrawOptions [

	^ self ffiCall: #(void moz2d_draw_target_mask_surface (
		MozCanvas canvas,
		MozNativePattern aSourcePattern,
		MozSurface aMaskSurface,
		float offsetX,
		float offsetY,
		MozDrawOptions aMoz2DDrawOptions))
]
