Class {
	#name : #SkiaTypes,
	#superclass : #SharedPool,
	#classVars : [
		'TiledFigureId',
		'scalar'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'class initialization' }
SkiaTypes class >> initialize [
	scalar := #float32.
	TiledFigureId := #uint32
]
