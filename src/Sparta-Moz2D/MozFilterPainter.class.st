Class {
	#name : #MozFilterPainter,
	#superclass : #SpartaFilterPainter,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#category : 'Sparta-Moz2D-Builders'
}

{ #category : #'library path' }
MozFilterPainter class >> ffiLibraryName [
	^ MozLibrary
]

{ #category : #drawing }
MozFilterPainter >> draw [
	"Primitive call"

	destinationPoint ifNil: [ destinationPoint := sourceRectangle origin ].
	self
		primDrawFilter: filter
		sourceRectangle: (MozNativeRect fromRectangle: sourceRectangle)
		destX: destinationPoint x
		destY: destinationPoint y
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
]

{ #category : #private }
MozFilterPainter >> primDrawFilter: aFilter sourceRectangle: aMoz2DRect destX: destX destY: destY drawOptions: aMoz2DDrawOptions [

	^ self ffiCall: #(void moz2d_draw_target_draw_filter(
		MozCanvas canvas,
		MozFilter aFilter,
		MozNativeRect aMoz2DRect,
		float destX,
		float destY,
		MozDrawOptions aMoz2DDrawOptions))
]
