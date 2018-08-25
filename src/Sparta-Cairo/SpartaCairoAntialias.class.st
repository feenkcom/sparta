Class {
	#name : #SpartaCairoAntialias,
	#superclass : #SpartaCairoEnum,
	#classVars : [
		'CAIRO_ANTIALIAS_BEST',
		'CAIRO_ANTIALIAS_DEFAULT',
		'CAIRO_ANTIALIAS_FAST',
		'CAIRO_ANTIALIAS_GOOD',
		'CAIRO_ANTIALIAS_GRAY',
		'CAIRO_ANTIALIAS_NONE',
		'CAIRO_ANTIALIAS_SUBPIXEL'
	],
	#category : 'Sparta-Cairo-Enums'
}

{ #category : #'accessing enum' }
SpartaCairoAntialias class >> CAIRO_ANTIALIAS_BEST [
	"This method was automatically generated"
	^ CAIRO_ANTIALIAS_BEST
]

{ #category : #'accessing enum' }
SpartaCairoAntialias class >> CAIRO_ANTIALIAS_DEFAULT [
	"This method was automatically generated"
	^ CAIRO_ANTIALIAS_DEFAULT
]

{ #category : #'accessing enum' }
SpartaCairoAntialias class >> CAIRO_ANTIALIAS_FAST [
	"This method was automatically generated"
	^ CAIRO_ANTIALIAS_FAST
]

{ #category : #'accessing enum' }
SpartaCairoAntialias class >> CAIRO_ANTIALIAS_GOOD [
	"This method was automatically generated"
	^ CAIRO_ANTIALIAS_GOOD
]

{ #category : #'accessing enum' }
SpartaCairoAntialias class >> CAIRO_ANTIALIAS_GRAY [
	"This method was automatically generated"
	^ CAIRO_ANTIALIAS_GRAY
]

{ #category : #'accessing enum' }
SpartaCairoAntialias class >> CAIRO_ANTIALIAS_NONE [
	"This method was automatically generated"
	^ CAIRO_ANTIALIAS_NONE
]

{ #category : #'accessing enum' }
SpartaCairoAntialias class >> CAIRO_ANTIALIAS_SUBPIXEL [
	"This method was automatically generated"
	^ CAIRO_ANTIALIAS_SUBPIXEL
]

{ #category : #'enum declaration' }
SpartaCairoAntialias class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		CAIRO_ANTIALIAS_DEFAULT 0

		"method"
		CAIRO_ANTIALIAS_NONE 1
		CAIRO_ANTIALIAS_GRAY 2
		CAIRO_ANTIALIAS_SUBPIXEL 3

		"hints"
		CAIRO_ANTIALIAS_FAST 4
		CAIRO_ANTIALIAS_GOOD 5
		CAIRO_ANTIALIAS_BEST 6
	)
]

{ #category : #initialization }
SpartaCairoAntialias class >> initialize [
	super initialize
]
