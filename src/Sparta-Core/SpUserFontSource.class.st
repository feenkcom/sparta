"
I represent a font face source and know how to retrieve font contents from it
"
Class {
	#name : #SpUserFontSource,
	#superclass : #Object,
	#category : 'Sparta-Core-Text'
}

{ #category : #comparing }
SpUserFontSource >> = anotherFontSource [
	^ self subclassResponsibility
]

{ #category : #accessing }
SpUserFontSource >> fontContents [
	"Return a binary font face contents"
	<return: #ByteArray>
	
	^ self subclassResponsibility
]

{ #category : #comparing }
SpUserFontSource >> hash [
	^ self subclassResponsibility
]
