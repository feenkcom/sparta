Class {
	#name : #SpartaFontSlant,
	#superclass : #SharedPool,
	#instVars : [
		'name',
		'value'
	],
	#classVars : [
		'Italic',
		'Normal',
		'Oblique',
		'Slants'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #'instance creation' }
SpartaFontSlant class >> fromNumber: aNumber [
	<return: #SpartaFontSlant>

	^ Slants
		at: aNumber
		ifAbsent: [ self weight: aNumber name: #custom ]
]

{ #category : #'class initialization' }
SpartaFontSlant class >> initialize [
	Normal := self slant: 0 name: #normal.
	Italic := self slant: 1 name: #italic.
	Oblique := self slant: 2 name: #oblique.
	
	Slants := (self classPool values select: [ :eachValue | eachValue isKindOf: self ] thenCollect: [ :eachSlant | eachSlant value -> eachSlant ]) as: Dictionary
]

{ #category : #accessing }
SpartaFontSlant class >> italic [
	^ Italic
]

{ #category : #accessing }
SpartaFontSlant class >> normal [
	^ Normal
]

{ #category : #accessing }
SpartaFontSlant class >> oblique [
	^ Oblique
]

{ #category : #'instance creation' }
SpartaFontSlant class >> slant: aSlantValue name: aSlantName [
	^ self new
		value: aSlantValue;
		name: aSlantName
]

{ #category : #comparing }
SpartaFontSlant >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ value = anObject value
]

{ #category : #comparing }
SpartaFontSlant >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ value hash
]

{ #category : #accessing }
SpartaFontSlant >> name [
	<return: #Symbol>

	^ name
]

{ #category : #accessing }
SpartaFontSlant >> name: aSymbol [
	name := aSymbol
]

{ #category : #printing }
SpartaFontSlant >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' value: ';
		print: value.
	aStream
		nextPutAll: ' name: ';
		print: name
]

{ #category : #accessing }
SpartaFontSlant >> value [
	<return: #Number>

	^ value
]

{ #category : #accessing }
SpartaFontSlant >> value: aNumber [
	value := aNumber
]
