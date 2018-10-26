"
I am a test case with overriden ffiLibraryName (because using Trait does not work with TestCase in Pharo7)
"
Class {
	#name : #MozTestCase,
	#superclass : #TestCase,
	#category : #'Sparta-Moz2D-Tests'
}

{ #category : #'library path' }
MozTestCase class >> ffiLibraryName [
	"Flatten because for some reason ffi trait does not work with tests"
	^ MozLibrary
]

{ #category : #'library path' }
MozTestCase >> ffiLibraryName [
	"Flatten because for some reason ffi trait does not work with tests"
	^ self class ffiLibraryName
]
