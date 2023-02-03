Class {
	#name : #SkiaInterfaceLoadCallback,
	#superclass : #FFICallback,
	#traits : 'TSkiaLibrary',
	#classTraits : 'TSkiaLibrary classTrait',
	#category : #'Sparta-Skia-External'
}

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
SkiaInterfaceLoadCallback >> ffiLibrary [

	^ self class ffiLibrary
]
