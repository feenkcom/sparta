Class {
	#name : #MozTextDrawMode,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'GLYPH_FILL',
		'GLYPH_PATH',
		'GLYPH_STROKE',
		'GLYPH_STROKE_UNDERNEATH'
	],
	#category : 'Sparta-Moz2D-Text-Enums'
}

{ #category : #'accessing enum' }
MozTextDrawMode class >> GLYPH_FILL [
	"This method was automatically generated"
	^ GLYPH_FILL
]

{ #category : #'accessing enum' }
MozTextDrawMode class >> GLYPH_PATH [
	"This method was automatically generated"
	^ GLYPH_PATH
]

{ #category : #'accessing enum' }
MozTextDrawMode class >> GLYPH_STROKE [
	"This method was automatically generated"
	^ GLYPH_STROKE
]

{ #category : #'accessing enum' }
MozTextDrawMode class >> GLYPH_STROKE_UNDERNEATH [
	"This method was automatically generated"
	^ GLYPH_STROKE_UNDERNEATH
]

{ #category : #'enum declaration' }
MozTextDrawMode class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		"GLYPH_FILL and GLYPH_STROKE draw into the current context
		and may be used together with bitwise OR."
		GLYPH_FILL 1
		GLYPH_STROKE 2
		"Appends glyphs to the current path. Can NOT be used with
		GLYPH_FILL or GLYPH_STROKE."
		GLYPH_PATH 4
		"When GLYPH_FILL and GLYPH_STROKE are both set, draws the
		stroke underneath the fill."
		GLYPH_STROKE_UNDERNEATH 8
	)
]

{ #category : #'class initialization' }
MozTextDrawMode class >> initialize [
	self initializeEnumeration
]
