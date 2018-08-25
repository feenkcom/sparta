Class {
	#name : #SpartaCairoFontType,
	#superclass : #SpartaCairoEnum,
	#classVars : [
		'CAIRO_FONT_TYPE_FT',
		'CAIRO_FONT_TYPE_QUARTZ',
		'CAIRO_FONT_TYPE_TOY',
		'CAIRO_FONT_TYPE_USER',
		'CAIRO_FONT_TYPE_WIN32'
	],
	#category : 'Sparta-Cairo-Enums'
}

{ #category : #'accessing enum' }
SpartaCairoFontType class >> CAIRO_FONT_TYPE_FT [
	"This method was automatically generated"
	^ CAIRO_FONT_TYPE_FT
]

{ #category : #'accessing enum' }
SpartaCairoFontType class >> CAIRO_FONT_TYPE_QUARTZ [
	"This method was automatically generated"
	^ CAIRO_FONT_TYPE_QUARTZ
]

{ #category : #'accessing enum' }
SpartaCairoFontType class >> CAIRO_FONT_TYPE_TOY [
	"This method was automatically generated"
	^ CAIRO_FONT_TYPE_TOY
]

{ #category : #'accessing enum' }
SpartaCairoFontType class >> CAIRO_FONT_TYPE_USER [
	"This method was automatically generated"
	^ CAIRO_FONT_TYPE_USER
]

{ #category : #'accessing enum' }
SpartaCairoFontType class >> CAIRO_FONT_TYPE_WIN32 [
	"This method was automatically generated"
	^ CAIRO_FONT_TYPE_WIN32
]

{ #category : #'enum declaration' }
SpartaCairoFontType class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		CAIRO_FONT_TYPE_TOY 0
		CAIRO_FONT_TYPE_FT 1
		CAIRO_FONT_TYPE_WIN32 2
		CAIRO_FONT_TYPE_QUARTZ 3
		CAIRO_FONT_TYPE_USER 4
	)
]

{ #category : #initialization }
SpartaCairoFontType class >> initialize [
	super initialize
]
