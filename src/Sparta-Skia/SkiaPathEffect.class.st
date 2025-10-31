Class {
	#name : #SkiaPathEffect,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaPathEffect class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_path_effect_drop(void* aHandle))
]
