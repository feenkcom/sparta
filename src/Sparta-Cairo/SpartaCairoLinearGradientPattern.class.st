Class {
	#name : #SpartaCairoLinearGradientPattern,
	#superclass : #SpartaCairoGradientPattern,
	#category : 'Sparta-Cairo-External'
}

{ #category : #'instance creation' }
SpartaCairoLinearGradientPattern class >> from: aFromPoint to: aToPoint [

	^ (self
		primCreateFromX: aFromPoint x
		fromY: aFromPoint y
		toX: aToPoint x
		toY: aToPoint y) autoRelease
]

{ #category : #'private - ffi' }
SpartaCairoLinearGradientPattern class >> primCreateFromX: fromX fromY: fromY toX: toX toY: toY [

	^ self ffiCall: #(#SpartaCairoLinearGradientPattern cairo_pattern_create_linear (
			double fromX,
			double fromY,
			double toX,
			double toY ) )
]
