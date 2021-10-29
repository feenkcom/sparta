Class {
	#name : #SkiaTypes,
	#superclass : #SharedPool,
	#classVars : [
		'scalar'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : #'class initialization' }
SkiaTypes class >> initialize [
	scalar := #float32
]
