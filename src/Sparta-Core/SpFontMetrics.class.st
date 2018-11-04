Class {
	#name : #SpFontMetrics,
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
SpFontMetrics >> aveCharWidth [
	^ aveCharWidth
]

{ #category : #accessing }
SpFontMetrics >> capHeight [
	^ capHeight
]

{ #category : #accessing }
SpFontMetrics >> emAscent [
	^ emAscent
]

{ #category : #accessing }
SpFontMetrics >> emDescent [
	^ emDescent
]

{ #category : #accessing }
SpFontMetrics >> emHeight [
	^ emHeight
]

{ #category : #accessing }
SpFontMetrics >> externalLeading [
	"Describes how much extra space the font designer expects the application to leave between rows of the font,
	basically it is another name for the line gap"
	<return: #Number>

	^ externalLeading
]

{ #category : #accessing }
SpFontMetrics >> internalLeading [
	"Describes how much space has been left inside the font bitmap for diacritical marks (accents).
	It is usually (but not necessarily) computed as internal leading = ascent - descent - EM size"
	<return: #Number>

	^ internalLeading
]

{ #category : #accessing }
SpFontMetrics >> maxAdvance [
	^ maxAdvance
]

{ #category : #accessing }
SpFontMetrics >> maxAscent [
	^ maxAscent
]

{ #category : #accessing }
SpFontMetrics >> maxDescent [
	^ maxDescent
]

{ #category : #accessing }
SpFontMetrics >> maxHeight [
	^ maxHeight
]

{ #category : #accessing }
SpFontMetrics >> spaceWidth [
	^ spaceWidth
]

{ #category : #accessing }
SpFontMetrics >> strikeoutOffset [
	^ strikeoutOffset
]

{ #category : #accessing }
SpFontMetrics >> strikeoutSize [
	^ strikeoutSize
]

{ #category : #accessing }
SpFontMetrics >> underlineOffset [
	^ underlineOffset
]

{ #category : #accessing }
SpFontMetrics >> underlineSize [
	^ underlineSize
]

{ #category : #accessing }
SpFontMetrics >> xHeight [
	^ xHeight
]

{ #category : #accessing }
SpFontMetrics >> zeroOrAveCharWidth [
	^ zeroOrAveCharWidth
]
