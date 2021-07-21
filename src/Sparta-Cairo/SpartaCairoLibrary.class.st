Class {
	#name : #SpartaCairoLibrary,
	#superclass : #FFILibrary,
	#category : #'Sparta-Cairo-Library'
}

{ #category : #'api - library' }
SpartaCairoLibrary >> detectLibrary: aFileName [
	"Pharo9 introduced a platform specific FFILibraryFinder which should be used instead of this custom implementation"

	^ ({ Smalltalk imageDirectory . Smalltalk vmDirectory . Smalltalk vmBinary parent / 'Plugins'. FileSystem workingDirectory }
		collect: [ :aPath | aPath asFileReference / aFileName ])
			detect: #exists
			ifFound: #fullName
			ifNone: [ aFileName ]
]

{ #category : #'api - library' }
SpartaCairoLibrary >> macLibraryName [
	^ self class environment
		at: #FFIMacLibraryFinder
		ifPresent: [ :aLibraryFinder | aLibraryFinder findAnyLibrary: #('libcairo.dylib' 'libcairo.2.dylib') ]
		ifAbsent: [ self detectLibrary: 'libcairo.2.dylib' ]
]

{ #category : #'accessing platform' }
SpartaCairoLibrary >> unix32LibraryName [
	^ self class environment
		at: #FFIUnix32LibraryFinder
		ifPresent: [ :aLibraryFinder | aLibraryFinder findAnyLibrary: #('libcairo.so.2') ]
		ifAbsent: [ self detectLibrary: 'libcairo.so.2' ]
]

{ #category : #'accessing platform' }
SpartaCairoLibrary >> unix64LibraryName [
	^ self class environment
		at: #FFIUnix64LibraryFinder
		ifPresent: [ :aLibraryFinder | aLibraryFinder findAnyLibrary: #('libcairo.so.2') ]
		ifAbsent: [ self detectLibrary: 'libcairo.so.2' ]
]

{ #category : #'accessing platform' }
SpartaCairoLibrary >> win32LibraryName [
	^ self class environment
		at: #FFIWindowsLibraryFinder
		ifPresent: [ :aLibraryFinder | aLibraryFinder findAnyLibrary: #('libcairo-2.dll') ]
		ifAbsent: [ self detectLibrary: 'libcairo-2.dll' ]
]
