Class {
	#name : #MozTextBoundingBoxType,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'LOOSE_INK_EXTENTS',
		'TIGHT_HINTED_OUTLINE_EXTENTS',
		'TIGHT_INK_EXTENTS'
	],
	#category : 'Sparta-Moz2D-Text-Enums'
}

{ #category : #'accessing enum' }
MozTextBoundingBoxType class >> LOOSE_INK_EXTENTS [
	"This method was automatically generated"
	^ LOOSE_INK_EXTENTS
]

{ #category : #'accessing enum' }
MozTextBoundingBoxType class >> TIGHT_HINTED_OUTLINE_EXTENTS [
	"This method was automatically generated"
	^ TIGHT_HINTED_OUTLINE_EXTENTS
]

{ #category : #'accessing enum' }
MozTextBoundingBoxType class >> TIGHT_INK_EXTENTS [
	"This method was automatically generated"
	^ TIGHT_INK_EXTENTS
]

{ #category : #'enum declaration' }
MozTextBoundingBoxType class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		LOOSE_INK_EXTENTS 0
		TIGHT_INK_EXTENTS 1
		TIGHT_HINTED_OUTLINE_EXTENTS 2
	)
]

{ #category : #'class initialization' }
MozTextBoundingBoxType class >> initialize [
	self initializeEnumeration
]
