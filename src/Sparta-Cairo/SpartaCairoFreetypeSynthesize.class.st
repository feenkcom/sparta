Class {
	#name : #SpartaCairoFreetypeSynthesize,
	#superclass : #SpartaCairoEnum,
	#classVars : [
		'CAIRO_FT_SYNTHESIZE_BOLD',
		'CAIRO_FT_SYNTHESIZE_OBLIQUE'
	],
	#category : 'Sparta-Cairo-Enums'
}

{ #category : #'accessing enum' }
SpartaCairoFreetypeSynthesize class >> CAIRO_FT_SYNTHESIZE_BOLD [
	"This method was automatically generated"
	^ CAIRO_FT_SYNTHESIZE_BOLD
]

{ #category : #'accessing enum' }
SpartaCairoFreetypeSynthesize class >> CAIRO_FT_SYNTHESIZE_OBLIQUE [
	"This method was automatically generated"
	^ CAIRO_FT_SYNTHESIZE_OBLIQUE
]

{ #category : #'enum declaration' }
SpartaCairoFreetypeSynthesize class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		CAIRO_FT_SYNTHESIZE_BOLD 1
		CAIRO_FT_SYNTHESIZE_OBLIQUE 2
	)
]

{ #category : #initialization }
SpartaCairoFreetypeSynthesize class >> initialize [
	super initialize
]
