"
I am a concrete Library installer for Windows.
"
Class {
	#name : #MozLibraryWindows,
	#superclass : #MozLibraryPlatform,
	#category : 'Sparta-Moz2D-Installer'
}

{ #category : #library }
MozLibraryWindows >> libraryDirectories [
	^ {
		Smalltalk vm fullPath asFileReference parent
	}
]

{ #category : #library }
MozLibraryWindows >> libraryDirectory [
	^ Smalltalk vm fullPath asFileReference parent
]

{ #category : #library }
MozLibraryWindows >> libraryName [
	^ 'libMoz2D.dll'
]

{ #category : #library }
MozLibraryWindows >> libraryPlatform [
	^ 'win'
]
