Class {
	#name : 'SkiaCompositionLayer',
	#superclass : 'SkiaExternalObject',
	#category : 'Sparta-Skia-External'
}

{ #category : 'private - ffi' }
SkiaCompositionLayer class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_composition_layer_drop(void** aHandle))
]

{ #category : 'adding' }
SkiaCompositionLayer >> addLayer: aSkiaCompositionLayer [
	self primAddLayer: aSkiaCompositionLayer
]

{ #category : 'accessing' }
SkiaCompositionLayer >> layersCount [
	<return: #Number>
	
	^ self primCountLayers
]

{ #category : 'private - ffi' }
SkiaCompositionLayer >> primAddLayer: aSkiaCompositionLayer [
	self ffiCall: #(void skia_composition_layer_add(self, SkiaCompositionLayer aSkiaCompositionLayer))
]

{ #category : 'private - ffi' }
SkiaCompositionLayer >> primCountLayers [
	^ self ffiCall: #(size_t skia_composition_layer_count_layers(self))
]

{ #category : 'private - ffi' }
SkiaCompositionLayer >> primCountRefs [
	^ self ffiCall: #(size_t skia_composition_layer_count_refs(self))
]

{ #category : 'accessing' }
SkiaCompositionLayer >> referenceCount [
	<return: #Number>
	
	^ self primCountRefs
]
