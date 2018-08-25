Class {
	#name : #SpartaCairoCapStyle,
	#superclass : #SpartaCairoEnum,
	#classVars : [
		'CAIRO_LINE_CAP_BUTT',
		'CAIRO_LINE_CAP_ROUND',
		'CAIRO_LINE_CAP_SQUARE'
	],
	#category : 'Sparta-Cairo-Enums'
}

{ #category : #'accessing enum' }
SpartaCairoCapStyle class >> CAIRO_LINE_CAP_BUTT [
	"This method was automatically generated"
	^ CAIRO_LINE_CAP_BUTT
]

{ #category : #'accessing enum' }
SpartaCairoCapStyle class >> CAIRO_LINE_CAP_ROUND [
	"This method was automatically generated"
	^ CAIRO_LINE_CAP_ROUND
]

{ #category : #'accessing enum' }
SpartaCairoCapStyle class >> CAIRO_LINE_CAP_SQUARE [
	"This method was automatically generated"
	^ CAIRO_LINE_CAP_SQUARE
]

{ #category : #'enum declaration' }
SpartaCairoCapStyle class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		CAIRO_LINE_CAP_BUTT 0
		CAIRO_LINE_CAP_ROUND 1
		CAIRO_LINE_CAP_SQUARE 2
	)
]

{ #category : #initialization }
SpartaCairoCapStyle class >> initialize [
	super initialize
]
