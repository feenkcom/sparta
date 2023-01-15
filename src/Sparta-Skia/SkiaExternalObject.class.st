Class {
	#name : #SkiaExternalObject,
	#superclass : #GtBoxerValueBox,
	#pools : [
		'SkiaTypes'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'library path' }
SkiaExternalObject class >> ffiLibrary [
	^ SkiaLibrary
]
