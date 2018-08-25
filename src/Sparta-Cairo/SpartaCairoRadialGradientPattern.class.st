Class {
	#name : #SpartaCairoRadialGradientPattern,
	#superclass : #SpartaCairoGradientPattern,
	#category : 'Sparta-Cairo-External'
}

{ #category : #'instance creation' }
SpartaCairoRadialGradientPattern class >> innerCenter: anInnerCenter innerRadius: anInnerRadius outerCenter: anOuterCenter outerRadius: anOuterRadius [

	^ (self
		primCreateInnerX: anInnerCenter x
		innerY: anInnerCenter y
		innerRadius: anInnerRadius
		outerX: anOuterCenter x
		outerY: anOuterCenter y
		outerRadius: anOuterRadius) autoRelease
]

{ #category : #'private - ffi' }
SpartaCairoRadialGradientPattern class >> primCreateInnerX: anInnerX innerY: anInnerY innerRadius: anInnerRadius outerX: anOuterX outerY: anOuterY outerRadius: anOuterRadius [

	self ffiCall: #(SpartaCairoRadialGradientPattern cairo_pattern_create_radial (
			double anInnerX,
			double anInnerY,
			double anInnerRadius,
			double anOuterX,
			double anOuterY,
			double anOuterRadius))
]
