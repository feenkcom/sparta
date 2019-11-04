Class {
	#name : #SkiaTextBlob,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaTextBlob class >> primCreate [
	^ self ffiCall: #(void* skia_text_blob_default())
]

{ #category : #'private - ffi' }
SkiaTextBlob class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_text_blob_drop(void* aHandle))
]
