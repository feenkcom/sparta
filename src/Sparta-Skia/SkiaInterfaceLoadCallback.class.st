Class {
	#name : #SkiaInterfaceLoadCallback,
	#superclass : #FFICallback,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaInterfaceLoadCallback class >> ffiLibrary [
	^ SkiaThreadedLibrary
]

{ #category : #'callback spec' }
SkiaInterfaceLoadCallback class >> fnSpec [
	^ #(void* ( void* aGtBoxerStringHandle ))
]

{ #category : #'instance creation' }
SkiaInterfaceLoadCallback class >> on: aBlock [
	^ self 
		newCallbackWithSignature: self fnSpec 
		block: aBlock
]

{ #category : #'private - ffi' }
SkiaInterfaceLoadCallback >> calloutAPIClass [

	^ ThreadedFFIMigration threadedFFIAvailable
		ifTrue: [ TFCalloutAPI ]
		ifFalse: [ super calloutAPIClass ]
]

{ #category : #'private - ffi' }
SkiaInterfaceLoadCallback >> ffiLibrary [

	^ self class ffiLibrary
]
