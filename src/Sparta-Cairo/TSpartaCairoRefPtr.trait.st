Trait {
	#name : #TSpartaCairoRefPtr,
	#category : 'Sparta-Cairo-Library'
}

{ #category : #accessing }
TSpartaCairoRefPtr classSide >> addRef: aHandle [

	self primAddRef: aHandle value
]

{ #category : #finalization }
TSpartaCairoRefPtr classSide >> finalizeResourceData: aHandle [
	
	self release: aHandle
]

{ #category : #'private - ffi' }
TSpartaCairoRefPtr classSide >> primAddRef: aHandle [

	^ self explicitRequirement
]

{ #category : #'private - ffi' }
TSpartaCairoRefPtr classSide >> primRefCount: aHandle [

	^ self explicitRequirement
]

{ #category : #'private - ffi' }
TSpartaCairoRefPtr classSide >> primRelease: aHandle [

	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaCairoRefPtr classSide >> refCount: aHandle [

	^ self primRefCount: aHandle
]

{ #category : #finalization }
TSpartaCairoRefPtr classSide >> release: aHandle [
	| refCount |

	aHandle isNull
		"A handle may already be null, if garbage collector did his job before us :) "
		ifTrue: [ ^ self ].

	"amout of references before release"
	refCount := (self primRefCount: aHandle).
	refCount = 0
		ifTrue: [ 
			self warning: [ 'Trying to release a reference with 0 refCount!' ].
			^ self ].
	
	self warning: [ '(', aHandle value asString, ') RefCount: ', (refCount - 1) asString ].
	self primRelease: aHandle.

	refCount := refCount - 1.
	
	self
		assert: [ refCount >= 0 ]
		description: [ 'Reference count can only be positive!' ].
	
	"always nullify handle, since object gets garbage collected on pharo side"
	aHandle getHandle beNull
]

{ #category : #adding }
TSpartaCairoRefPtr >> addRef [

	self class addRef: self resourceData
]

{ #category : #accessing }
TSpartaCairoRefPtr >> refCount [
	"Return amount of counted references. If refCount is zero (0),
	something is wrong, because as soon as it drops to 0 object
	gets automatically deleted"
	<return: #Number>

	^ self class refCount: self resourceData
]

{ #category : #accessing }
TSpartaCairoRefPtr >> release [

	self class release: self resourceData.
	
	"#release is sent manually, so we want to make sure that resource is no longer
	added to weak registry - performance improvement"
	FFIExternalResourceManager removeResource: self
]
