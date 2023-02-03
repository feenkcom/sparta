Class {
	#name : #SkiaCompositionLayer,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'private - ffi' }
SkiaCompositionLayer class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void compositor_layer_drop(void* aHandle))
]

{ #category : #accessing }
SkiaCompositionLayer >> layersCount [
	<return: #Number>
	
	^ self primCountLayers
]

{ #category : #'private - ffi' }
SkiaCompositionLayer >> primCountLayers [
	^ self ffiCall: #(size_t compositor_layer_count_layers(self))
]

{ #category : #'private - ffi' }
SkiaCompositionLayer >> primCountRefs [
	^ self ffiCall: #(size_t compositor_layer_count_refs(self))
]

{ #category : #'private - ffi' }
SkiaCompositionLayer >> primDebug [
	^ self ffiCall: #(void* compositor_layer_debug(self))
]

{ #category : #'private - ffi' }
SkiaCompositionLayer >> primWithLayers: aSkiaCompositionLayers [
	^ self ffiCall: #(void* compositor_layer_with_layers(self, SkiaCompositorLayers aSkiaCompositionLayers))
]

{ #category : #accessing }
SkiaCompositionLayer >> printOn: aStream [
	self ffiLibrary
		unsafeStringFromHandle: self primDebug
		during: [ :aStringBox |
			aStringBox string
				ifEmpty: [
					aStream
						nextPutAll: self class name;
						space;
						nextPutAll: ' (null)' ]
				ifNotEmpty: [ :aString | aStream nextPutAll: aString ] ]
]

{ #category : #accessing }
SkiaCompositionLayer >> referenceCount [
	<return: #Number>
	
	^ self primCountRefs
]

{ #category : #accessing }
SkiaCompositionLayer >> withLayers: aCollectionOfLayers [
	aCollectionOfLayers ifEmpty: [ ^ self ].

	^ SkiaCompositorLayers newDuring: [ :theCompositorLayers |
		aCollectionOfLayers do: [ :eachLayer | theCompositorLayers add: eachLayer ].
		self class fromNativeHandle: (self primWithLayers: theCompositorLayers) ]
]
