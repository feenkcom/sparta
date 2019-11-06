Class {
	#name : #SpartaFontWeight,
	#superclass : #SharedPool,
	#instVars : [
		'name',
		'value'
	],
	#classVars : [
		'Black',
		'Bold',
		'ExtraBlack',
		'ExtraBold',
		'ExtraLight',
		'Invisible',
		'Light',
		'Medium',
		'Normal',
		'SemiBold',
		'Thin'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #accessing }
SpartaFontWeight class >> black [
	^ Black
]

{ #category : #accessing }
SpartaFontWeight class >> bold [
	^ Bold
]

{ #category : #accessing }
SpartaFontWeight class >> extraBlack [
	^ ExtraBlack
]

{ #category : #accessing }
SpartaFontWeight class >> extraBold [
	^ ExtraBold
]

{ #category : #accessing }
SpartaFontWeight class >> extraLight [
	^ ExtraLight
]

{ #category : #'class initialization' }
SpartaFontWeight class >> initialize [
	Invisible := self weight: 0 name: #invisible.
	Thin := self weight: 100 name: #thin.
	ExtraLight := self weight: 200 name: #extraLight.
	Light := self weight: 300 name: #light.
	Normal := self weight: 400 name: #normal.
	Medium := self weight: 500 name: #medium.
	SemiBold := self weight: 600 name: #semiBold.
	Bold := self weight: 700 name: #bold.
	ExtraBold := self weight: 800 name: #extraBold.
	Black := self weight: 900 name: #black.
	ExtraBlack := self weight: 1000 name: #extraBlack
]

{ #category : #accessing }
SpartaFontWeight class >> invisible [
	^ Invisible
]

{ #category : #accessing }
SpartaFontWeight class >> light [
	^ Light
]

{ #category : #accessing }
SpartaFontWeight class >> medium [
	^ Medium
]

{ #category : #accessing }
SpartaFontWeight class >> normal [
	^ Normal
]

{ #category : #accessing }
SpartaFontWeight class >> semiBold [
	^ SemiBold
]

{ #category : #accessing }
SpartaFontWeight class >> thin [
	^ Thin
]

{ #category : #'instance creation' }
SpartaFontWeight class >> weight: aWeightValue name: aWeightName [
	^ self new
		value: aWeightValue;
		name: aWeightName
]

{ #category : #accessing }
SpartaFontWeight >> name [
	<return: #Symbol>

	^ name
]

{ #category : #accessing }
SpartaFontWeight >> name: aSymbol [
	name := aSymbol
]

{ #category : #accessing }
SpartaFontWeight >> value [
	<return: #Number>

	^ value
]

{ #category : #accessing }
SpartaFontWeight >> value: aNumber [
	value := aNumber
]
