Class {
	#name : #SpartaCairoPdfCanvas,
	#superclass : #SpartaCairoCanvas,
	#category : 'Sparta-Cairo'
}

{ #category : #'private - ffi' }
SpartaCairoPdfCanvas class >> primCreate: aSurface [

	^ self ffiCall: #(SpartaCairoPdfCanvas cairo_create (SpartaCairoSurface aSurface) )
]

{ #category : #drawing }
SpartaCairoPdfCanvas >> flush [
	self isValid
		ifFalse: [ self error: 'Pdf canvas is no more valid. Create a new one' ].

	super flush.
	self surface release.
	self release
]
