"
I provide a Moz2D ffi library name.

I must be used by all classes that perform ffi calls to Moz2D library
"
Trait {
	#name : #TMozLibrary,
	#category : 'Sparta-Moz2D-Library'
}

{ #category : #'library path' }
TMozLibrary classSide >> ffiLibraryName [
	^ MozLibrary
]

{ #category : #'library path' }
TMozLibrary >> ffiLibraryName [
	^ self class ffiLibraryName
]
