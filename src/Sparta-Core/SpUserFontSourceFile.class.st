"
I am a file source.
Can be used for fast scripting without the need to load font in the image or install.
May be useful if font are intended to be deployed outside of the image
"
Class {
	#name : #SpUserFontSourceFile,
	#superclass : #SpUserFontSource,
	#instVars : [
		'file'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #comparing }
SpUserFontSourceFile >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	^ anotherObject file = self file
]

{ #category : #accessing }
SpUserFontSourceFile >> file [
	^ file
]

{ #category : #accessing }
SpUserFontSourceFile >> file: anObject [
	file := anObject
]

{ #category : #accessing }
SpUserFontSourceFile >> fontContents [
	| aBuffer |

	aBuffer := #[].
	self file asFileReference binaryReadStreamDo: [ :aStream | aBuffer := aStream contents ].
	^ aBuffer
]

{ #category : #comparing }
SpUserFontSourceFile >> hash [
	^ self file hash
]
