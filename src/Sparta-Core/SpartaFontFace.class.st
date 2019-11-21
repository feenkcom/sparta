"
I represent a font face.
My properties are backend specific
"
Class {
	#name : #SpartaFontFace,
	#superclass : #Object,
	#instVars : [
		'familyName',
		'style',
		'weight',
		'stretch'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #comparing }
SpartaFontFace >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	^ anotherObject familyName = self familyName
		and: [ anotherObject stretch value = self stretch value
			and: [ anotherObject style value = self style value
				and: [ anotherObject weight value = self weight value ] ] ]
]

{ #category : #accessing }
SpartaFontFace >> familyName [
	<return: #String>

	^ familyName
]

{ #category : #accessing }
SpartaFontFace >> familyName: aString [
	familyName := aString
]

{ #category : #comparing }
SpartaFontFace >> hash [
	^ self familyName hash
		bitXor: (self stretch value hash
			bitXor: (self style value hash
				bitXor: self weight value hash))
]

{ #category : #printing }
SpartaFontFace >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' weight: ';
		print: weight.
	aStream
		nextPutAll: ' style: ';
		print: style.
	aStream
		nextPutAll: ' stretch: ';
		print: stretch.
	aStream
		nextPutAll: ' familyName: ';
		print: familyName
]

{ #category : #accessing }
SpartaFontFace >> stretch [
	^ stretch
]

{ #category : #accessing }
SpartaFontFace >> stretch: anObject [
	stretch := anObject
]

{ #category : #accessing }
SpartaFontFace >> style [
	^ style
]

{ #category : #accessing }
SpartaFontFace >> style: aSpartaFontSlant [
	self
		assert: [ aSpartaFontSlant isKindOf: SpartaFontSlant ]
		description: [ 'Slant must be a refined object' ].

	style := aSpartaFontSlant
]

{ #category : #accessing }
SpartaFontFace >> weight [
	<return: #SpartaFontWeight>

	^ weight
]

{ #category : #accessing }
SpartaFontFace >> weight: aSpartaFontWeight [

	self
		assert: [ aSpartaFontWeight isKindOf: SpartaFontWeight ]
		description: [ 'Weight must be a refined object' ].

	weight := aSpartaFontWeight
]
