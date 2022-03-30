Class {
	#name : #SkiaCompositionClipLayer,
	#superclass : #SkiaCompositionLayer,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositionClipLayer class >> circle: aSpartaCircle offset: anOffset [
	^ SkiaCompositorGeometry
		circle: aSpartaCircle
		during: [ :aGeometry | self geometry: aGeometry offset: anOffset ]
]

{ #category : #'instance creation' }
SkiaCompositionClipLayer class >> geometry: aSkiaCompositorGeometry offset: anOffset [
	^ self fromNativeHandle: (self primClipGeometry: aSkiaCompositorGeometry offsetX: anOffset x offsetY: anOffset y)
]

{ #category : #'instance creation' }
SkiaCompositionClipLayer class >> none [
	^ self new
]

{ #category : #'instance creation' }
SkiaCompositionClipLayer class >> path: aSkiaPath offset: anOffset [
	^ SkiaCompositorGeometry
		path: aSkiaPath
		during: [ :aGeometry | self geometry: aGeometry offset: anOffset ]
]

{ #category : #'private - ffi' }
SkiaCompositionClipLayer class >> primClipGeometry: aSkiaCompositorGeometry offsetX: anOffsetX offsetY: anOffsetY [
	^ self ffiCall: #(void* compositor_clip_layer_new(
		SkiaCompositorGeometry aSkiaCompositorGeometry,
		float32 anOffsetX, float32 anOffsetY))
]

{ #category : #'private - ffi' }
SkiaCompositionClipLayer class >> primCreate [
	^ self ffiCall: #(void* compositor_clip_layer_none())
]

{ #category : #'instance creation' }
SkiaCompositionClipLayer class >> rectangle: aSpartaRectangle offset: anOffset [
	^ SkiaCompositorGeometry
		rectangle: aSpartaRectangle
		during: [ :aGeometry | self geometry: aGeometry offset: anOffset ]
]

{ #category : #'instance creation' }
SkiaCompositionClipLayer class >> roundedRectangle: aSpartaRoundedRectangle offset: anOffset [
	^ SkiaCompositorGeometry
		roundedRectangle: aSpartaRoundedRectangle
		during: [ :aGeometry | self geometry: aGeometry offset: anOffset ]
]
