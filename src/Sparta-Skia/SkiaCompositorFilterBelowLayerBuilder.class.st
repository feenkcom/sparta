Class {
	#name : #SkiaCompositorFilterBelowLayerBuilder,
	#superclass : #Object,
	#instVars : [
		'filter',
		'offset'
	],
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'api - builder' }
SkiaCompositorFilterBelowLayerBuilder >> buildForGeometry: aSkiaCompositorGeometry [
	^ SkiaCompositionFilterBelowLayer
		filter: self filter
		geometry: aSkiaCompositorGeometry
		offset: self offset
]

{ #category : #accessing }
SkiaCompositorFilterBelowLayerBuilder >> filter [
	^ filter
]

{ #category : #accessing }
SkiaCompositorFilterBelowLayerBuilder >> filter: anObject [
	filter := anObject
]

{ #category : #initialization }
SkiaCompositorFilterBelowLayerBuilder >> initialize [
	super initialize.
	offset := 0 @ 0
]

{ #category : #accessing }
SkiaCompositorFilterBelowLayerBuilder >> offset [
	^ offset
]

{ #category : #accessing }
SkiaCompositorFilterBelowLayerBuilder >> offset: anObject [
	offset := anObject
]

{ #category : #'api - builder' }
SkiaCompositorFilterBelowLayerBuilder >> pushCircle: aSpartaCircle [
	^ SkiaCompositorGeometry
		circle: aSpartaCircle
		during: [ :aGeometry | self buildForGeometry: aGeometry ]
]

{ #category : #'api - builder' }
SkiaCompositorFilterBelowLayerBuilder >> pushPath: aSpartaPath [
	^ SkiaCompositorGeometry
		path: aSpartaPath
		during: [ :aGeometry | self buildForGeometry: aGeometry ]
]

{ #category : #'api - builder' }
SkiaCompositorFilterBelowLayerBuilder >> pushRectangle: aSpartaRectangle [
	^ SkiaCompositorGeometry
		rectangle: aSpartaRectangle
		during: [ :aGeometry | self buildForGeometry: aGeometry ]
]

{ #category : #'api - builder' }
SkiaCompositorFilterBelowLayerBuilder >> pushRoundedRectangle: aSpartaRoundedRectangle [
	^ SkiaCompositorGeometry
		roundedRectangle: aSpartaRoundedRectangle
		during: [ :aGeometry | self buildForGeometry: aGeometry ]
]
