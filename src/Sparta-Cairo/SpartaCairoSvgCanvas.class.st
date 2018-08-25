Class {
	#name : #SpartaCairoSvgCanvas,
	#superclass : #SpartaCairoCanvas,
	#category : 'Sparta-Cairo'
}

{ #category : #'private - ffi' }
SpartaCairoSvgCanvas class >> primCreate: aSurface [

	^ self ffiCall: #(SpartaCairoSvgCanvas cairo_create (SpartaCairoSurface aSurface) )
]

{ #category : #accessing }
SpartaCairoSvgCanvas >> flush [
	self isValid
		ifFalse: [ self error: 'Svg canvas is no more valid. Create a new one' ].

	super flush.
	self surface release.
	self release
]
