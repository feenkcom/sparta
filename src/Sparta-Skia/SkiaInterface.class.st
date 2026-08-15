Class {
	#name : #SkiaInterface,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaInterface class >> load: aBlock [
	^ self shouldNotImplement
]

{ #category : #'instance creation' }
SkiaInterface class >> native [
	<return: #SkiaInterface>
	
	^ self new
]

{ #category : #'private - ffi' }
SkiaInterface class >> primCreate [
	^ self ffiCall: #(void* skia_interface_new_native())
]

{ #category : #'private - ffi' }
SkiaInterface class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_interface_drop(void* aHandle))
]
