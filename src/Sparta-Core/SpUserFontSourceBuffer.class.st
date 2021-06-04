"
I am a buffer source.
Is useful if font is stored as byte array in the image

"
Class {
	#name : #SpUserFontSourceBuffer,
	#superclass : #SpUserFontSource,
	#instVars : [
		'buffer'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #comparing }
SpUserFontSourceBuffer >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	^ anotherObject buffer == self buffer
]

{ #category : #accessing }
SpUserFontSourceBuffer >> buffer [
	^ buffer
]

{ #category : #accessing }
SpUserFontSourceBuffer >> buffer: anObject [
	buffer := anObject
]

{ #category : #accessing }
SpUserFontSourceBuffer >> fontContents [
	^ self buffer
]

{ #category : #comparing }
SpUserFontSourceBuffer >> hash [
	^ self buffer identityHash
]
