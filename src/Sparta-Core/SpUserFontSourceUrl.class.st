"
I am an url source.
Useful if user wants to try a font from the web without the need to even download it.
Requires internet connection to retrieve font content.
"
Class {
	#name : #SpUserFontSourceUrl,
	#superclass : #SpUserFontSource,
	#instVars : [
		'url'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #comparing }
SpUserFontSourceUrl >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	^ anotherObject url = self url
]

{ #category : #accessing }
SpUserFontSourceUrl >> fontContents [
	^ self url asUrl retrieveContents
]

{ #category : #comparing }
SpUserFontSourceUrl >> hash [
	^ self url hash
]

{ #category : #accessing }
SpUserFontSourceUrl >> url [
	^ url
]

{ #category : #accessing }
SpUserFontSourceUrl >> url: anObject [
	url := anObject
]
