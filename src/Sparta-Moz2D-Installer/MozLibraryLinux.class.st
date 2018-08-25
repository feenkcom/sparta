"
I am a concrete Library installer for Linux
"
Class {
	#name : #MozLibraryLinux,
	#superclass : #MozLibraryPlatform,
	#category : 'Sparta-Moz2D-Installer'
}

{ #category : #library }
MozLibraryLinux >> libraryDirectories [
	^ { 
		Smalltalk vm fullPath asFileReference parent / 'bin'.
		Smalltalk vm fullPath asFileReference parent.
		Smalltalk image imageDirectory asFileReference
	}
]

{ #category : #library }
MozLibraryLinux >> libraryDirectory [
	^ { 
		Smalltalk vm fullPath asFileReference parent / 'bin'.
		Smalltalk vm fullPath asFileReference parent.
		Smalltalk image imageDirectory asFileReference
	} detect: [ :path | path exists and: [ path isWritable ] ]
	  ifNone: [ Error signal: 'Could not find writable directory to install library!' ]
]

{ #category : #library }
MozLibraryLinux >> libraryName [
	^ 'libMoz2D.so'
]

{ #category : #library }
MozLibraryLinux >> libraryPlatform [
	^ 'linux'
]
