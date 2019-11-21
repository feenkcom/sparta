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
		'Oblique'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #'class initialization' }
SpartaFontSlant class >> initialize [
	Normal := self slant: 0 name: #normal.
	Italic := self slant: 1 name: #italic.
	Oblique := self slant: 2 name: #oblique.
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

{ #category : #accessing }
SpartaFontSlant >> name [
	<return: #Symbol>

	^ name
]

{ #category : #accessing }
SpartaFontSlant >> name: aSymbol [
	name := aSymbol
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
