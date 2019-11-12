Class {
	#name : #SkiaLayerBuilder,
	#superclass : #SpartaLayerBuilder,
	#category : #'Sparta-Skia-Builders'
}

{ #category : #'api - layer' }
SkiaLayerBuilder >> pop [
	canvas surfaceCanvas restore
]

{ #category : #'api - layer' }
SkiaLayerBuilder >> push [
	| aSkiaSaveLayerRec |
	
	aSkiaSaveLayerRec := SkiaSaveLayerRec new.
	aSkiaSaveLayerRec paint: (SkiaPaint new alpha: alpha).
	
	canvas surfaceCanvas saveLayer: aSkiaSaveLayerRec
]
