Class {
	#name : #SkiaInterface,
	#superclass : #SkiaExternalObject,
	#category : 'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaInterface class >> load: aBlock [
	^ self fromNativeHandle: (self primLoadWith: (self primLoaderCallbackFor: aBlock))
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
SkiaInterface class >> primLoadWith: aCallback [
	^ self ffiCall: #(void* skia_interface_new_load_with(SkiaInterfaceLoadCallback aCallback))
]

{ #category : #'private - ffi' }
SkiaInterface class >> primLoaderCallbackFor: aBlock [
	| aCallback |
	
	aCallback := SkiaInterfaceLoadCallback on: [ :aStringBoxHandle |
		"Rust owns aGtBoxerStringHandle, we should not take ownership"
		self ffiLibrary
			unsafeStringFromHandle: aStringBoxHandle
			during: [ :aStringBox | aBlock value: aStringBox string ] ].

	^ aCallback
]

{ #category : #'private - ffi' }
SkiaInterface class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_interface_drop(void* aHandle))
]
