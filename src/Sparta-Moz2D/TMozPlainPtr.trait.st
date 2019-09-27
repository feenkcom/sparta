"
I add general mechanism of deleting C++ objects that does not implement smart pointers and have public destructors
"
Trait {
	#name : #TMozPlainPtr,
	#category : 'Sparta-Moz2D-Library'
}

{ #category : #finalization }
TMozPlainPtr classSide >> finalizeResourceData: aHandle [
	
	self release: aHandle
]

{ #category : #'private - ffi' }
TMozPlainPtr classSide >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	^ self explicitRequirement
]

{ #category : #finalization }
TMozPlainPtr classSide >> release: aHandle [

	aHandle isNull
		"A handle may already be null, if garbage collector did his job before us :) "
		ifTrue: [ ^ self ].

	self warning: [ '(', aHandle value asString, ') Ptr: ', aHandle value asString ].
	self primRelease: aHandle.
	aHandle getHandle beNull
]

{ #category : #'initialize-release' }
TMozPlainPtr >> release [

	self class release: self resourceData.
	
	"#release is sent manually, so we want to make sure that resource is no longer
	added to weak registry - performance improvement"
	FFIExternalResourceManager removeResource: self
]
