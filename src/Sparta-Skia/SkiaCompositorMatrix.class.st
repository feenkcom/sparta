Class {
	#name : #SkiaCompositorMatrix,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositorMatrix class >> buffer: anArrayF32 during: aBlock [
	^ self
		fromNativeHandle: (self primNew: anArrayF32)
		during: aBlock
]

{ #category : #'instance creation' }
SkiaCompositorMatrix class >> matrix: aSpartaMatrix during: aBlock [
	^ SkiaMatrix
		fromSpartaMatrix: aSpartaMatrix
		during: [ :aSkiaMatrix |
			self ffiLibrary
				newArrayF32During: [ :anArrayF32 |
					aSkiaMatrix primGetAll: anArrayF32.
					self buffer: anArrayF32 during: aBlock ] ]
]

{ #category : #'private - ffi' }
SkiaCompositorMatrix class >> primNew: aGtBoxerArrayF32 [
	^ self ffiCall: #(void* compositor_matrix_new(GtBoxerArrayF32 aGtBoxerArrayF32))
]

{ #category : #'private - ffi' }
SkiaCompositorMatrix class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void compositor_matrix_drop(void* aHandle))
]
