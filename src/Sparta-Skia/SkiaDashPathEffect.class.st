Class {
	#name : 'SkiaDashPathEffect',
	#superclass : 'SkiaPathEffect',
	#category : 'Sparta-Skia-External'
}

{ #category : 'instance creation' }
SkiaDashPathEffect class >> pattern: anArrayOfFloats offset: aNumber [
	^ GtBoxerArrayF32
		withAll: anArrayOfFloats
		during: [ :aBoxerArrayF32 | self fromNativeHandle: (self primCreatePattern: aBoxerArrayF32 offset: aNumber) ]
]

{ #category : 'instance creation' }
SkiaDashPathEffect class >> pattern: anArrayOfFloats offset: aNumber during: aBlock [
	^ GtBoxerArrayF32
		withAll: anArrayOfFloats
		during: [ :aBoxerArrayF32 | self fromNativeHandle: (self primCreatePattern: aBoxerArrayF32 offset: aNumber) during: aBlock ]
]

{ #category : 'private - ffi' }
SkiaDashPathEffect class >> primCreatePattern: aBoxerArrayF32 offset: anOffset [
	^ self ffiCall: #(void* skia_path_effect_dash(GtBoxerArrayF32 aBoxerArrayF32, scalar anOffset))
]
