"
Field for orientation of the textrun and glyphs within it.

Possible values of the TEXT_ORIENT_MASK field:
	TEXT_ORIENT_HORIZONTAL
	TEXT_ORIENT_VERTICAL_UPRIGHT
	TEXT_ORIENT_VERTICAL_SIDEWAYS_RIGHT
	TEXT_ORIENT_VERTICAL_SIDEWAYS_LEFT
	TEXT_ORIENT_VERTICAL_MIXED
For all VERTICAL settings, the x and y coordinates of glyph positions are exchanged, so that simple advances are vertical.

The MIXED value indicates vertical textRuns for which the CSS text-orientation property is 'mixed', but is never used for individual glyphRuns; it will be resolved to either UPRIGHT or SIDEWAYS_RIGHT according to the UTR50 properties of the characters, and separate glyphRuns created for the resulting glyph orientations.
"
Class {
	#name : #MozTextOrientation,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'HORIZONTAL',
		'MASK',
		'VERTICAL_MIXED',
		'VERTICAL_SIDEWAYS_LEFT',
		'VERTICAL_SIDEWAYS_RIGHT',
		'VERTICAL_UPRIGHT'
	],
	#category : 'Sparta-Moz2D-Text-Enums'
}

{ #category : #'accessing enum' }
MozTextOrientation class >> HORIZONTAL [
	"This method was automatically generated"
	^ HORIZONTAL
]

{ #category : #'accessing enum' }
MozTextOrientation class >> MASK [
	"This method was automatically generated"
	^ MASK
]

{ #category : #'accessing enum' }
MozTextOrientation class >> VERTICAL_MIXED [
	"This method was automatically generated"
	^ VERTICAL_MIXED
]

{ #category : #'accessing enum' }
MozTextOrientation class >> VERTICAL_SIDEWAYS_LEFT [
	"This method was automatically generated"
	^ VERTICAL_SIDEWAYS_LEFT
]

{ #category : #'accessing enum' }
MozTextOrientation class >> VERTICAL_SIDEWAYS_RIGHT [
	"This method was automatically generated"
	^ VERTICAL_SIDEWAYS_RIGHT
]

{ #category : #'accessing enum' }
MozTextOrientation class >> VERTICAL_UPRIGHT [
	"This method was automatically generated"
	^ VERTICAL_UPRIGHT
]

{ #category : #'enum declaration' }
MozTextOrientation class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		HORIZONTAL              16r0000
		VERTICAL_UPRIGHT        16r1000
		VERTICAL_SIDEWAYS_RIGHT 16r2000
		VERTICAL_SIDEWAYS_LEFT  16r4000
		VERTICAL_MIXED          16r8000
		MASK                    16rF000
	)
]

{ #category : #'class initialization' }
MozTextOrientation class >> initialize [
	self initializeEnumeration
]

{ #category : #testing }
MozTextOrientation >> isHorizontal [
	^ self = MozTextOrientation HORIZONTAL
]

{ #category : #testing }
MozTextOrientation >> isVertical [
	^ self isHorizontal not
]
