"
I provide support of C++ classes that have inlined reference counting mechanism.

Smart pointers can not be just deleted, instead users need to release a reference decreasing references count by one. As soon as ref.count becomes zero, an object will be deleted automatically.

! I must be used together with TMozDebug and TMozLibrary traits.
Classes that use me must implement #resourceData that returns a handle (ExternalData or ExternalAddress)
"
Trait {
	#name : #TMozInlineRefPtr,
	#category : 'Sparta-Moz2D-Library'
}

{ #category : #accessing }
TMozInlineRefPtr classSide >> addRef: aHandle [

	self primAddRef: aHandle
]

{ #category : #finalization }
TMozInlineRefPtr classSide >> finalizeResourceData: aHandle [
	
	self release: aHandle
]

{ #category : #'private - ffi' }
TMozInlineRefPtr classSide >> primAddRef: aHandle [

	^ self explicitRequirement
]

{ #category : #'private - ffi' }
TMozInlineRefPtr classSide >> primRelease: aHandle [

	^ self explicitRequirement
]

{ #category : #finalization }
TMozInlineRefPtr classSide >> release: aHandle [

	aHandle isNull
		"A handle may already be null, if garbage collector did his job before us :) "
		ifTrue: [ ^ self ].

	self primRelease: aHandle.
		
	"always nullify handle, since object gets garbage collected on pharo side"
	aHandle getHandle beNull
]

{ #category : #accessing }
TMozInlineRefPtr >> addRef [

	self class addRef: self resourceData
]

{ #category : #'initialize-release' }
TMozInlineRefPtr >> release [

	self class release: self resourceData.
	"#release is sent manually, so we want to make sure that resource is no longer
	added to weak registry - performance improvement"
	FFIExternalResourceManager removeResource: self
]
