Class {
	#name : #SkiaSaveLayerRec,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaSaveLayerRec class >> primCreate [
	^ self ffiCall: #(void* skia_layer_rec_default())
]

{ #category : #'private - ffi' }
SkiaSaveLayerRec class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_layer_rec_drop(void* aHandle))
]

{ #category : #accessing }
SkiaSaveLayerRec >> bounds: aRectangle [
	self
		primSetBoundsLeft: aRectangle left
		top: aRectangle top
		right: aRectangle right
		bottom: aRectangle bottom
]

{ #category : #accessing }
SkiaSaveLayerRec >> paint: aSkiaPaint [
	self primSetPaint: aSkiaPaint
]

{ #category : #'private - ffi' }
SkiaSaveLayerRec >> primSetBoundsLeft: aLeft top: aTop right: aRight bottom: aBottom [
	^ self ffiCall: #(void skia_layer_rec_set_bounds(self,
		scalar aLeft,
		scalar aTop,
		scalar aRight,
		scalar aBottom
	))
]

{ #category : #'private - ffi' }
SkiaSaveLayerRec >> primSetPaint: aSkiaPaint [
	^ self ffiCall: #(void skia_layer_rec_set_paint(self, SkiaPaint aSkiaPaint))
]
