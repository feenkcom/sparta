Class {
	#name : #SpartaCairoExtendMode,
	#superclass : #SpartaCairoEnum,
	#classVars : [
		'CAIRO_EXTEND_NONE',
		'CAIRO_EXTEND_PAD',
		'CAIRO_EXTEND_REFLECT',
		'CAIRO_EXTEND_REPEAT'
	],
	#category : 'Sparta-Cairo-Enums'
}

{ #category : #'accessing enum' }
SpartaCairoExtendMode class >> CAIRO_EXTEND_NONE [
	"This method was automatically generated"
	^ CAIRO_EXTEND_NONE
]

{ #category : #'accessing enum' }
SpartaCairoExtendMode class >> CAIRO_EXTEND_PAD [
	"This method was automatically generated"
	^ CAIRO_EXTEND_PAD
]

{ #category : #'accessing enum' }
SpartaCairoExtendMode class >> CAIRO_EXTEND_REFLECT [
	"This method was automatically generated"
	^ CAIRO_EXTEND_REFLECT
]

{ #category : #'accessing enum' }
SpartaCairoExtendMode class >> CAIRO_EXTEND_REPEAT [
	"This method was automatically generated"
	^ CAIRO_EXTEND_REPEAT
]

{ #category : #'enum declaration' }
SpartaCairoExtendMode class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		CAIRO_EXTEND_NONE 0
		CAIRO_EXTEND_REPEAT 1
		CAIRO_EXTEND_REFLECT 2
		CAIRO_EXTEND_PAD 3
	)
]

{ #category : #initialization }
SpartaCairoExtendMode class >> initialize [
	super initialize
]
