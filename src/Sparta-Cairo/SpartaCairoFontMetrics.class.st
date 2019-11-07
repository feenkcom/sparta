Class {
	#name : #SpartaCairoFontMetrics,
	#superclass : #FFIExternalStructure,
	#traits : 'TSpartaCairoLibrary',
	#classTraits : 'TSpartaCairoLibrary classTrait',
	#classVars : [
		'OFFSET_ASCENT',
		'OFFSET_DESCENT',
		'OFFSET_HEIGHT',
		'OFFSET_MAXADVANCEX',
		'OFFSET_MAXADVANCEY'
	],
	#category : #'Sparta-Cairo-Text'
}

{ #category : #'field definition' }
SpartaCairoFontMetrics class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
		double ascent;
		double descent;
		double height;
		double maxAdvanceX;
		double maxAdvanceY;
	)
]

{ #category : #converting }
SpartaCairoFontMetrics >> asFontMetrics [
	^ SpartaFontMetrics new cairoInitializeFrom: self
]

{ #category : #'accessing structure variables' }
SpartaCairoFontMetrics >> ascent [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_ASCENT
]

{ #category : #'accessing structure variables' }
SpartaCairoFontMetrics >> ascent: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_ASCENT put: anObject
]

{ #category : #'accessing structure variables' }
SpartaCairoFontMetrics >> descent [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_DESCENT
]

{ #category : #'accessing structure variables' }
SpartaCairoFontMetrics >> descent: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_DESCENT put: anObject
]

{ #category : #'accessing structure variables' }
SpartaCairoFontMetrics >> height [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_HEIGHT
]

{ #category : #'accessing structure variables' }
SpartaCairoFontMetrics >> height: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_HEIGHT put: anObject
]

{ #category : #'accessing structure variables' }
SpartaCairoFontMetrics >> maxAdvanceX [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_MAXADVANCEX
]

{ #category : #'accessing structure variables' }
SpartaCairoFontMetrics >> maxAdvanceX: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_MAXADVANCEX put: anObject
]

{ #category : #'accessing structure variables' }
SpartaCairoFontMetrics >> maxAdvanceY [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_MAXADVANCEY
]

{ #category : #'accessing structure variables' }
SpartaCairoFontMetrics >> maxAdvanceY: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_MAXADVANCEY put: anObject
]
