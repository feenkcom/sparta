Class {
	#name : #SpartaFontStretch,
	#superclass : #SharedPool,
	#instVars : [
		'name',
		'value'
	],
	#classVars : [
		'Condensed',
		'Expanded',
		'ExtraCondensed',
		'ExtraExpanded',
		'Normal',
		'SemiCondensed',
		'SemiExpanded',
		'UltraCondensed',
		'UltraExpanded'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #'class initialization' }
SpartaFontStretch class >> initialize [
	UltraCondensed := self stretch: 0 name: #ultraCondensed.
	ExtraCondensed := self stretch: 1 name: #extraCondensed.
	Condensed := self stretch: 2 name: #condensed.
	SemiCondensed := self stretch: 3 name: #semiCondensed.
	Normal := self stretch: 4 name: #normal.
	SemiExpanded := self stretch: 5 name: #semiExpanded.
	Expanded := self stretch: 6 name: #expanded.
	ExtraExpanded := self stretch: 7 name: #extraExpanded.
	UltraExpanded := self stretch: 8 name: #ultraExpanded.
]

{ #category : #accessing }
SpartaFontStretch class >> normal [
	^ Normal
]

{ #category : #'instance creation' }
SpartaFontStretch class >> stretch: aStretchValue name: aStretchName [
	^ self new
		value: aStretchValue;
		name: aStretchName
]

{ #category : #accessing }
SpartaFontStretch >> name [
	<return: #Symbol>

	^ name
]

{ #category : #accessing }
SpartaFontStretch >> name: aSymbol [
	name := aSymbol
]

{ #category : #evaluating }
SpartaFontStretch >> value [
	<return: #Number>

	^ value
]

{ #category : #accessing }
SpartaFontStretch >> value: aNumber [
	value := aNumber
]
