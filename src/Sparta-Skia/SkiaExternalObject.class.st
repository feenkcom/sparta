Class {
	#name : #SkiaExternalObject,
	#superclass : #FFIExternalObject,
	#instVars : [
		'isAutoRelease'
	],
	#pools : [
		'SkiaTypes'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'library path' }
SkiaExternalObject class >> ffiLibraryName [
	^ SkiaLibrary
]

{ #category : #finalization }
SkiaExternalObject class >> finalizeResourceData: aHandle [
	
	self release: aHandle
]

{ #category : #'instance creation' }
SkiaExternalObject class >> fromHandle: aHandle [
	^ self basicNew
		initialize;
		setHandle: aHandle
]

{ #category : #'instance creation' }
SkiaExternalObject class >> fromNativeHandle: anExternalData [
	^ (self fromHandle: (anExternalData getHandle)) autoRelease
]

{ #category : #'instance creation' }
SkiaExternalObject class >> fromNativeHandle: anExternalData during: aBlock [
	"I create a new instance of me without auto-release for to evaluate a given block
	and then destroy me"
	| anExternalInstance |
	
	"Object understand release"
	anExternalInstance := Object new.
	^ [
		anExternalInstance := self fromHandle: (anExternalData getHandle).
		aBlock value: anExternalInstance ]
	ensure: [ anExternalInstance release ]
]

{ #category : #'instance creation' }
SkiaExternalObject class >> new [
	^ self fromNativeHandle: self primCreate
]

{ #category : #'instance creation' }
SkiaExternalObject class >> newDuring: aBlock [
	"I create a new instance of me without auto-release for to evaluate a given block
	and then destroy me"

	^ self fromNativeHandle: self primCreate during: aBlock
]

{ #category : #'instance creation' }
SkiaExternalObject class >> null [
	^ self fromHandle: self primNullPtr
]

{ #category : #'private - ffi' }
SkiaExternalObject class >> primCreate [
	^ self subclassResponsibility
]

{ #category : #'private - ffi' }
SkiaExternalObject class >> primNullPtr [
	^ self ffiCall: #(void* skia_null_ptr())
]

{ #category : #'private - ffi' }
SkiaExternalObject class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	"self ffiCall: #(void skia_object_drop(void* aHandle))"
	self subclassResponsibility
]

{ #category : #finalization }
SkiaExternalObject class >> release: aHandle [
	aHandle isNull
		"A handle may already be null, if garbage collector did his job before us :)"
		ifTrue: [ ^ self ].

	self warning: [ '(release) Ptr: ', aHandle value asString ].
	self primRelease: aHandle.
	aHandle getHandle beNull
]

{ #category : #debug }
SkiaExternalObject class >> warning: aMessageBlock [ 
	"| message |

	message := '[', self name asString ,'] ', aMessageBlock value.

	Transcript show: message; cr"
]

{ #category : #'external resource management' }
SkiaExternalObject >> autoRelease [
	"Note, subclasses should implement #resourceData
	and #finalizeResourceData: on class side"
	
	self isNull
		ifTrue: [ ^ self ].

	isAutoRelease := true.
	super autoRelease
]

{ #category : #dependencies }
SkiaExternalObject >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #dependencies }
SkiaExternalObject >> release [
	"#release is sent manually, so we want to make sure that resource is no longer
	added to weak registry - performance improvement"
	
	"we compare with true because isAutoRelease is nil be default"
	isAutoRelease == true
		ifTrue: [
			FFIExternalResourceManager uniqueInstance removeResource: self.
			isAutoRelease := false ].

	self class release: self resourceData
]
