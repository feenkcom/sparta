Class {
	#name : #SpartaCairoGlyph,
	#superclass : #FFIExternalStructure,
	#traits : 'TSpartaCairoLibrary',
	#classTraits : 'TSpartaCairoLibrary classTrait',
	#classVars : [
		'OFFSET_INDEX',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'Sparta-Cairo-Text'
}

{ #category : #'field definition' }
SpartaCairoGlyph class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
		ulong index;
		double x;
		double y;	
	)
]

{ #category : #'accessing structure variables' }
SpartaCairoGlyph >> index [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_INDEX
]

{ #category : #'accessing structure variables' }
SpartaCairoGlyph >> index: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_INDEX put: anObject
]

{ #category : #'accessing structure variables' }
SpartaCairoGlyph >> x [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_X
]

{ #category : #'accessing structure variables' }
SpartaCairoGlyph >> x: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_X put: anObject
]

{ #category : #'accessing structure variables' }
SpartaCairoGlyph >> y [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_Y
]

{ #category : #'accessing structure variables' }
SpartaCairoGlyph >> y: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_Y put: anObject
]
