Class {
	#name : #SkiaExternalObject,
	#superclass : #FFIExternalObject,
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
	^ self basicNew setHandle: aHandle
]

{ #category : #'instance creation' }
SkiaExternalObject class >> new [
	^ (self fromHandle: (self primCreate getHandle)) autoRelease
]

{ #category : #'private - ffi' }
SkiaExternalObject class >> primCreate [
	^ self subclassResponsibility
]

{ #category : #'private - ffi' }
SkiaExternalObject class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
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

{ #category : #dependencies }
SkiaExternalObject >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #dependencies }
SkiaExternalObject >> release [	
	"#release is sent manually, so we want to make sure that resource is no longer
	added to weak registry - performance improvement"
	(FFIExternalResourceManager uniqueInstance instVarNamed: #registry) remove: self ifAbsent: [ ].

	self class release: self resourceData
]
