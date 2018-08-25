Trait {
	#name : #TSpartaCairoPlainPtr,
	#category : 'Sparta-Cairo-Library'
}

{ #category : #finalization }
TSpartaCairoPlainPtr classSide >> finalizeResourceData: aHandle [
	
	self release: aHandle
]

{ #category : #finalization }
TSpartaCairoPlainPtr classSide >> primRelease: aHandle [

	"Plain pointers must be deleted using specific destroy*() methods, all users must implement a specific method"
	^ self explicitRequirement
]

{ #category : #finalization }
TSpartaCairoPlainPtr classSide >> release: aHandle [

	aHandle isNull
		"A handle may already be null, if garbage collector did his job before us :) "
		ifTrue: [ ^ self ].

	self warning: [ '(', aHandle value asString, ') Ptr: ', aHandle value asString ].
	self primRelease: aHandle.
	aHandle getHandle beNull
]

{ #category : #'initialize-release' }
TSpartaCairoPlainPtr >> release [

	self class release: self resourceData.
	
	"#release is sent manually, so we want to make sure that resource is no longer
	added to weak registry - performance improvement"
	FFIExternalResourceManager removeResource: self
]
