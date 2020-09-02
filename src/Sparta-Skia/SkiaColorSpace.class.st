Class {
	#name : #SkiaColorSpace,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaColorSpace class >> primCreate [
	^ self ffiCall: #(void* skia_color_space_new_srgb())
]

{ #category : #'private - ffi' }
SkiaColorSpace class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_color_space_drop(void** aHandle))
]

{ #category : #testing }
SkiaColorSpace >> isSrgb [
	^ self primIsSrgb
]

{ #category : #'private - ffi' }
SkiaColorSpace >> primIsSrgb [
	^ self ffiCall: #(bool skia_color_space_is_srgb(self))
]
