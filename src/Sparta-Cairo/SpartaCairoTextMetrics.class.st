"
I store the extents of a single glyph or a string of glyphs in user-space coordinates. Because text extents are in user-space coordinates, they are mostly, but not entirely, independent of the current transformation matrix. If you call cairo_scale(cr, 2.0, 2.0), text will be drawn twice as big, but the reported text extents will not be doubled. They will change slightly due to hinting (so you can't assume that metrics are independent of the transformation matrix), but otherwise will remain unchanged.

bearingX - the horizontal distance from the origin to the leftmost part of the glyphs as drawn. Positive if the glyphs lie entirely to the right of the origin.

bearingY - the vertical distance from the origin to the topmost part of the glyphs as drawn. Positive only if the glyphs lie completely below the origin; will usually be negative.

width - width of the glyphs as drawn

height - height of the glyphs as drawn

advanceX - distance to advance in the X direction after drawing these glyphs

advanceY - distance to advance in the Y direction after drawing these glyphs. Will typically be zero except for vertical text layout as found in East-Asian languages.
"
Class {
	#name : #SpartaCairoTextMetrics,
	#superclass : #FFIExternalStructure,
	#traits : 'TSpartaCairoLibrary',
	#classTraits : 'TSpartaCairoLibrary classTrait',
	#classVars : [
		'OFFSET_ADVANCEX',
		'OFFSET_ADVANCEY',
		'OFFSET_BEARINGX',
		'OFFSET_BEARINGY',
		'OFFSET_HEIGHT',
		'OFFSET_WIDTH'
	],
	#category : #'Sparta-Cairo-Text'
}

{ #category : #'field definition' }
SpartaCairoTextMetrics class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
		double bearingX;
		double bearingY;
		double width;
		double height;
		double advanceX;
		double advanceY;
	)
]

{ #category : #'accessing structure variables' }
SpartaCairoTextMetrics >> advanceX [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_ADVANCEX
]

{ #category : #'accessing structure variables' }
SpartaCairoTextMetrics >> advanceX: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_ADVANCEX put: anObject
]

{ #category : #'accessing structure variables' }
SpartaCairoTextMetrics >> advanceY [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_ADVANCEY
]

{ #category : #'accessing structure variables' }
SpartaCairoTextMetrics >> advanceY: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_ADVANCEY put: anObject
]

{ #category : #converting }
SpartaCairoTextMetrics >> asTextMetrics [
	^ SpartaTextMetrics new cairoInitializeFrom: self
]

{ #category : #'accessing structure variables' }
SpartaCairoTextMetrics >> bearingX [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_BEARINGX
]

{ #category : #'accessing structure variables' }
SpartaCairoTextMetrics >> bearingX: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_BEARINGX put: anObject
]

{ #category : #'accessing structure variables' }
SpartaCairoTextMetrics >> bearingY [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_BEARINGY
]

{ #category : #'accessing structure variables' }
SpartaCairoTextMetrics >> bearingY: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_BEARINGY put: anObject
]

{ #category : #'accessing structure variables' }
SpartaCairoTextMetrics >> height [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_HEIGHT
]

{ #category : #'accessing structure variables' }
SpartaCairoTextMetrics >> height: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_HEIGHT put: anObject
]

{ #category : #'accessing structure variables' }
SpartaCairoTextMetrics >> width [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_WIDTH
]

{ #category : #'accessing structure variables' }
SpartaCairoTextMetrics >> width: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_WIDTH put: anObject
]
