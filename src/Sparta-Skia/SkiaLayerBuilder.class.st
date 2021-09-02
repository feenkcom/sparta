Class {
	#name : 'SkiaLayerBuilder',
	#superclass : 'SpartaLayerBuilder',
	#category : 'Sparta-Skia-Builders'
}

{ #category : 'api - layer' }
SkiaLayerBuilder >> pop [
	canvas surfaceCanvas restore
]

{ #category : 'api - layer' }
SkiaLayerBuilder >> push [
	SkiaPaint newDuring: [ :aSkiaPaint |
		aSkiaPaint alpha: alpha.
		SkiaSaveLayerRec newDuring: [ :aSkiaSaveLayerRec |
			aSkiaSaveLayerRec paint: aSkiaPaint.	
			canvas surfaceCanvas saveLayer: aSkiaSaveLayerRec  ] ]
]
