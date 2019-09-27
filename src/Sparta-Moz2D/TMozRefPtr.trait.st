"
I add transparent support of C++ smart pointers (RefPtr)

Smart pointers can not be just deleted, instead users need to release a reference decreasing references count by one. As soon as ref.count becomes zero, an object will be deleted automatically.

Since all C++ classes that support smart pointers are subclasses of RefPtr<T> we can provide a single unified method of accessing and releaseing RefPtr itself without cairing about template class.

! I must be used together with TMozDebug and TMozLibrary traits.
Classes that use me must implement #resourceData that returns a handle (ExternalData or ExternalAddress)
"
Trait {
	#name : #TMozRefPtr,
	#category : 'Sparta-Moz2D-Library'
}

{ #category : #accessing }
TMozRefPtr classSide >> addRef: aHandle [

	self primAddRef: aHandle
]

{ #category : #finalization }
TMozRefPtr classSide >> finalizeResourceData: aHandle [
	
	self release: aHandle
]

{ #category : #'private - ffi' }
TMozRefPtr classSide >> primAddRef: aHandle [

	^ self ffiCall: #(ulong moz2d_ref_ptr_add_ref ( void* aHandle ) )
]

{ #category : #'private - ffi' }
TMozRefPtr classSide >> primRefCount: aHandle [

	^ self ffiCall: #(ulong moz2d_ref_ptr_count( void* aHandle ) )
]

{ #category : #'private - ffi' }
TMozRefPtr classSide >> primRelease: aHandle [

	^ self ffiCall: #( void moz2d_ref_ptr_release( void* aHandle ) )
]

{ #category : #accessing }
TMozRefPtr classSide >> refCount: aHandle [

	^ self primRefCount: aHandle
]

{ #category : #finalization }
TMozRefPtr classSide >> release: aHandle [
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

{ #category : #accessing }
TMozRefPtr >> addRef [

	self class addRef: self resourceData
]

{ #category : #accessing }
TMozRefPtr >> refCount [
	"Return amount of counted references. If refCount is zero (0),
	something is wrong, because as soon as it drops to 0 object
	gets automatically deleted"
	<return: #Number>

	^ self class refCount: self resourceData
]

{ #category : #'initialize-release' }
TMozRefPtr >> release [

	self class release: self resourceData.
	
	"#release is sent manually, so we want to make sure that resource is no longer
	added to weak registry - performance improvement"
	FFIExternalResourceManager removeResource: self
]
