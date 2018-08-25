"
enum FloodFilterAtts
{
   ATT_FLOOD_COLOR = 0                                  // Color
};
"
Class {
	#name : #MozFloodFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_FLOOD_COLOR'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozFloodFilterAtts class >> ATT_FLOOD_COLOR [
	"This method was automatically generated"
	^ ATT_FLOOD_COLOR
]

{ #category : #'enum declaration' }
MozFloodFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		ATT_FLOOD_COLOR 0 "Color"
	)
]

{ #category : #'class initialization' }
MozFloodFilterAtts class >> initialize [
	self initializeEnumeration
]
