"
I am a concrete Library installer for Mac OS X
"
Class {
	#name : #MozLibraryMac,
	#superclass : #MozLibraryPlatform,
	#category : 'Sparta-Moz2D-Installer'
}

{ #category : #library }
MozLibraryMac >> libraryDirectories [
	^ {
		Smalltalk vm fullPath asFileReference parent / 'Plugins'
	}
]

{ #category : #library }
MozLibraryMac >> libraryDirectory [
	^ Smalltalk vm fullPath asFileReference parent / 'Plugins'
]

{ #category : #library }
MozLibraryMac >> libraryName [
	^ 'libMoz2D.dylib'
]

{ #category : #library }
MozLibraryMac >> libraryPlatform [
	^ 'osx'
]
