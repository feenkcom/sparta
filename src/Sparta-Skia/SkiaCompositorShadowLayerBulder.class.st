Class {
	#name : #SkiaCompositorShadowLayerBulder,
	#superclass : #Object,
	#instVars : [
		'color',
		'radius',
		'offset'
	],
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'api - builder' }
SkiaCompositorShadowLayerBulder >> buildForGeometry: aSkiaCompositorGeometry [
	^ SkiaCompositorShadow
		color: self color
		radius: self radius
		offset: self offset
		geometry: aSkiaCompositorGeometry
		during: [ :aShadow | SkiaCompositionShadowLayer shadow: aShadow ]
]

{ #category : #accessing }
SkiaCompositorShadowLayerBulder >> color [

	^ color
]

{ #category : #accessing }
SkiaCompositorShadowLayerBulder >> color: anObject [

	color := anObject
]

{ #category : #accessing }
SkiaCompositorShadowLayerBulder >> offset [

	^ offset
]

{ #category : #accessing }
SkiaCompositorShadowLayerBulder >> offset: anObject [

	offset := anObject
]

{ #category : #'api - builder' }
SkiaCompositorShadowLayerBulder >> pushCircle: aSpartaCircle [
	^ SkiaCompositorGeometry
		circle: aSpartaCircle
		during: [ :aGeometry | self buildForGeometry: aGeometry ]
]

{ #category : #'api - builder' }
SkiaCompositorShadowLayerBulder >> pushPath: aSpartaPath [
	^ SkiaCompositorGeometry
		path: aSpartaPath
		during: [ :aGeometry | self buildForGeometry: aGeometry ]
]

{ #category : #'api - builder' }
SkiaCompositorShadowLayerBulder >> pushRectangle: aSpartaRectangle [
	^ SkiaCompositorGeometry
		rectangle: aSpartaRectangle
		during: [ :aGeometry | self buildForGeometry: aGeometry ]
]

{ #category : #'api - builder' }
SkiaCompositorShadowLayerBulder >> pushRoundedRectangle: aSpartaRoundedRectangle [
	^ SkiaCompositorGeometry
		roundedRectangle: aSpartaRoundedRectangle
		during: [ :aGeometry | self buildForGeometry: aGeometry ]
]

{ #category : #accessing }
SkiaCompositorShadowLayerBulder >> radius [

	^ radius
]

{ #category : #accessing }
SkiaCompositorShadowLayerBulder >> radius: anObject [

	radius := anObject
]
