Class {
	#name : 'SkiaTextRun',
	#superclass : 'Object',
	#traits : 'TSpTextRun',
	#classTraits : 'TSpTextRun classTrait',
	#instVars : [
		'bounds',
		'glyphs',
		'advance',
		'font'
	],
	#category : 'Sparta-Skia-Text'
}

{ #category : 'instance creation' }
SkiaTextRun class >> fromString: aString [
	<return: #SkiaTextRun>

	^ SkiaFont newDuring: [ :aSkiaFont | self fromString: aString font: aSkiaFont ]
]

{ #category : 'instance creation' }
SkiaTextRun class >> fromString: aString font: aSkiaFont [
	<return: #SkiaTextRun>

	^ SkiaPaint newDuring: [ :aSkiaPaint | self fromString: aString font: aSkiaFont paint: aSkiaPaint ]
]

{ #category : 'instance creation' }
SkiaTextRun class >> fromString: aString font: aSkiaFont paint: aSkiaPaint [
	<return: #SkiaTextRun>

	^ aSkiaFont stringToTextRun: aString paint: aSkiaPaint
]

{ #category : 'accessing' }
SkiaTextRun >> advance [
	^ advance
]

{ #category : 'private - accessing' }
SkiaTextRun >> advance: anObject [
	advance := anObject
]

{ #category : 'accessing' }
SkiaTextRun >> bounds [
	^ bounds
]

{ #category : 'private - accessing' }
SkiaTextRun >> bounds: anObject [
	bounds := anObject
]

{ #category : 'accessing' }
SkiaTextRun >> font [
	<return: #SkiaFont>

	^ font
]

{ #category : 'private - accessing' }
SkiaTextRun >> font: anObject [
	font := anObject
]

{ #category : 'accessing' }
SkiaTextRun >> glyphs [
	^ glyphs
]

{ #category : 'private - accessing' }
SkiaTextRun >> glyphs: anObject [
	glyphs := anObject
]

{ #category : 'testing' }
SkiaTextRun >> isNull [
	<return: #Boolean>

	^ false
]

{ #category : 'accessing' }
SkiaTextRun >> size [
	"Return a number of glyphs that build this text"
	<return: #Number>

	^ glyphs size // 2
]
