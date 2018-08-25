Class {
	#name : #SpartaCairoHintStyle,
	#superclass : #SpartaCairoEnum,
	#classVars : [
		'CAIRO_HINT_STYLE_DEFAULT',
		'CAIRO_HINT_STYLE_FULL',
		'CAIRO_HINT_STYLE_MEDIUM',
		'CAIRO_HINT_STYLE_NONE',
		'CAIRO_HINT_STYLE_SLIGHT'
	],
	#category : 'Sparta-Cairo-Enums'
}

{ #category : #'accessing enum' }
SpartaCairoHintStyle class >> CAIRO_HINT_STYLE_DEFAULT [
	"This method was automatically generated"
	^ CAIRO_HINT_STYLE_DEFAULT
]

{ #category : #'accessing enum' }
SpartaCairoHintStyle class >> CAIRO_HINT_STYLE_FULL [
	"This method was automatically generated"
	^ CAIRO_HINT_STYLE_FULL
]

{ #category : #'accessing enum' }
SpartaCairoHintStyle class >> CAIRO_HINT_STYLE_MEDIUM [
	"This method was automatically generated"
	^ CAIRO_HINT_STYLE_MEDIUM
]

{ #category : #'accessing enum' }
SpartaCairoHintStyle class >> CAIRO_HINT_STYLE_NONE [
	"This method was automatically generated"
	^ CAIRO_HINT_STYLE_NONE
]

{ #category : #'accessing enum' }
SpartaCairoHintStyle class >> CAIRO_HINT_STYLE_SLIGHT [
	"This method was automatically generated"
	^ CAIRO_HINT_STYLE_SLIGHT
]

{ #category : #'enum declaration' }
SpartaCairoHintStyle class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		CAIRO_HINT_STYLE_DEFAULT 0
		CAIRO_HINT_STYLE_NONE 1
		CAIRO_HINT_STYLE_SLIGHT 2
		CAIRO_HINT_STYLE_MEDIUM 3
		CAIRO_HINT_STYLE_FULL 4
	)
]

{ #category : #initialization }
SpartaCairoHintStyle class >> initialize [
	super initialize
]
