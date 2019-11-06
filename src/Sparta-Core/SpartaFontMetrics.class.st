Class {
	#name : #SpartaFontMetrics,
	#superclass : #Object,
	#instVars : [
		'aveCharWidth',
		'emAscent',
		'emDescent',
		'emHeight',
		'externalLeading',
		'internalLeading',
		'maxAdvance',
		'maxAscent',
		'maxDescent',
		'maxHeight',
		'spaceWidth',
		'strikeoutOffset',
		'strikeoutSize',
		'underlineOffset',
		'underlineSize',
		'xHeight',
		'zeroOrAveCharWidth',
		'capHeight'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #accessing }
SpartaFontMetrics >> aveCharWidth [
	^ aveCharWidth
]

{ #category : #accessing }
SpartaFontMetrics >> capHeight [
	^ capHeight
]

{ #category : #accessing }
SpartaFontMetrics >> emAscent [
	^ emAscent
]

{ #category : #accessing }
SpartaFontMetrics >> emDescent [
	^ emDescent
]

{ #category : #accessing }
SpartaFontMetrics >> emHeight [
	^ emHeight
]

{ #category : #accessing }
SpartaFontMetrics >> externalLeading [
	"Describes how much extra space the font designer expects the application to leave between rows of the font,
	basically it is another name for the line gap"
	<return: #Number>

	^ externalLeading
]

{ #category : #accessing }
SpartaFontMetrics >> internalLeading [
	"Describes how much space has been left inside the font bitmap for diacritical marks (accents).
	It is usually (but not necessarily) computed as internal leading = ascent - descent - EM size"
	<return: #Number>

	^ internalLeading
]

{ #category : #accessing }
SpartaFontMetrics >> maxAdvance [
	^ maxAdvance
]

{ #category : #accessing }
SpartaFontMetrics >> maxAscent [
	^ maxAscent
]

{ #category : #accessing }
SpartaFontMetrics >> maxDescent [
	^ maxDescent
]

{ #category : #accessing }
SpartaFontMetrics >> maxHeight [
	^ maxHeight
]

{ #category : #accessing }
SpartaFontMetrics >> spaceWidth [
	^ spaceWidth
]

{ #category : #accessing }
SpartaFontMetrics >> strikeoutOffset [
	^ strikeoutOffset
]

{ #category : #accessing }
SpartaFontMetrics >> strikeoutSize [
	^ strikeoutSize
]

{ #category : #accessing }
SpartaFontMetrics >> underlineOffset [
	^ underlineOffset
]

{ #category : #accessing }
SpartaFontMetrics >> underlineSize [
	^ underlineSize
]

{ #category : #accessing }
SpartaFontMetrics >> xHeight [
	^ xHeight
]

{ #category : #accessing }
SpartaFontMetrics >> zeroOrAveCharWidth [
	^ zeroOrAveCharWidth
]
