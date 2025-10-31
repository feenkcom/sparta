Class {
	#name : #SkiaDashPathEffect,
	#superclass : #SkiaPathEffect,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaDashPathEffect class >> pattern: anArrayOfFloats offset: aNumber [
	^ self ffiLibrary
		newArrayF32WithAll: anArrayOfFloats
		during: [ :anArrayF32 | self fromNativeHandle: (self primCreatePattern: anArrayF32 offset: aNumber) ]
]

{ #category : #'instance creation' }
SkiaDashPathEffect class >> pattern: anArrayOfFloats offset: aNumber during: aBlock [
	^ self ffiLibrary
		newArrayF32WithAll: anArrayOfFloats
		during: [ :anArrayF32 |
			self
				fromNativeHandle: (self primCreatePattern: anArrayF32 offset: aNumber)
				during: aBlock ]
]

{ #category : #'private - ffi' }
SkiaDashPathEffect class >> primCreatePattern: aBoxerArrayF32 offset: anOffset [
	^ self ffiCall: #(void* skia_path_effect_dash(GtBoxerArrayF32 aBoxerArrayF32, scalar anOffset))
]
