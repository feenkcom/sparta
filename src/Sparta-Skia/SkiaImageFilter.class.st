Class {
	#name : #SkiaImageFilter,
	#superclass : #SkiaExternalObject,
	#category : 'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaImageFilter class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_image_filter_drop(void* aHandle))
]
