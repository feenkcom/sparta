Class {
	#name : #SpartaCairoFillRule,
	#superclass : #SpartaCairoEnum,
	#classVars : [
		'CAIRO_FILL_RULE_EVEN_ODD',
		'CAIRO_FILL_RULE_WINDING'
	],
	#category : #'Sparta-Cairo-Enums'
}

{ #category : #'accessing enum' }
SpartaCairoFillRule class >> CAIRO_FILL_RULE_EVEN_ODD [
	"This method was automatically generated"
	^ CAIRO_FILL_RULE_EVEN_ODD
]

{ #category : #'accessing enum' }
SpartaCairoFillRule class >> CAIRO_FILL_RULE_WINDING [
	"This method was automatically generated"
	^ CAIRO_FILL_RULE_WINDING
]

{ #category : #'enum declaration' }
SpartaCairoFillRule class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		CAIRO_FILL_RULE_WINDING 0
		CAIRO_FILL_RULE_EVEN_ODD 1
	)
]

{ #category : #initialization }
SpartaCairoFillRule class >> initialize [
	super initialize
]
