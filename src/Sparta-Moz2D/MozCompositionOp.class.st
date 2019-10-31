"
I represent a  type of compositing operation to apply when performing drawing operation

	OP_ADD
	OP_ATOP - The new shape is only drawn where it overlaps the existing canvas content.
	OP_COLOR - Preserves the luma of the bottom layer, while adopting the hue and chroma of the top layer.
	OP_COLOR_BURN - Divides the inverted bottom layer by the top layer, and then inverts the result.
	OP_COLOR_DODGE - Divides the bottom layer by the inverted top layer.
	OP_COUNT
	OP_DARKEN - Retains the darkest pixels of both layers.
	OP_DEST_ATOP - The existing canvas is only kept where it overlaps the new shape. The new shape is drawn behind the canvas content.
	OP_DEST_IN - The existing canvas content is kept where both the new shape and existing canvas content overlap. Everything else is made transparent.
	OP_DEST_OUT - The existing content is kept where it doesn't overlap the new shape.
	OP_DEST_OVER - New shapes are drawn behind the existing canvas content.
	OP_DIFFERENCE - Subtracts the bottom layer from the top layer or the other way round to always get a positive value.
	OP_EXCLUSION - Like difference, but with lower contrast.
	OP_HARD_LIGHT - A combination of multiply and screen like overlay, but with top and bottom layer swapped.
	OP_HUE - Preserves the luma and chroma of the bottom layer, while adopting the hue of the top layer.
	OP_IN - The new shape is drawn only where both the new shape and the destination canvas overlap. Everything else is made transparent.
	OP_LIGHTEN - Retains the lightest pixels of both layers.
	OP_LUMINOSITY - Preserves the hue and chroma of the bottom layer, while adopting the luma of the top layer.
	OP_MULTIPLY - The pixels are of the top layer are multiplied with the corresponding pixel of the bottom layer. A darker picture is the result.
	OP_OUT - The new shape is drawn where it doesn't overlap the existing canvas content.
	OP_OVER - This is the default setting and draws new shapes on top of the existing canvas content.
	OP_OVERLAY - A combination of multiply and screen. Dark parts on the base layer become darker, and light parts become lighter.
	OP_SATURATION - Preserves the luma and hue of the bottom layer, while adopting the chroma of the top layer.
	OP_SCREEN - The pixels are inverted, multiplied, and inverted again. A lighter picture is the result (opposite of multiply)
	OP_SOFT_LIGHT - A softer version of hard-light. Pure black or white does not result in pure black or white.
	OP_SOURCE
	OP_XOR - Shapes are made transparent where both overlap and drawn normal everywhere else.
	
https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/globalCompositeOperation
"
Class {
	#name : #MozCompositionOp,
	#superclass : #MozEnum,
	#classVars : [
		'OP_ADD',
		'OP_ATOP',
		'OP_CLEAR',
		'OP_COLOR',
		'OP_COLOR_BURN',
		'OP_COLOR_DODGE',
		'OP_COUNT',
		'OP_DARKEN',
		'OP_DEST_ATOP',
		'OP_DEST_IN',
		'OP_DEST_OUT',
		'OP_DEST_OVER',
		'OP_DIFFERENCE',
		'OP_EXCLUSION',
		'OP_HARD_LIGHT',
		'OP_HUE',
		'OP_IN',
		'OP_LIGHTEN',
		'OP_LUMINOSITY',
		'OP_MULTIPLY',
		'OP_OUT',
		'OP_OVER',
		'OP_OVERLAY',
		'OP_SATURATION',
		'OP_SCREEN',
		'OP_SOFT_LIGHT',
		'OP_SOURCE',
		'OP_XOR'
	],
	#category : 'Sparta-Moz2D-Enums'
}

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_ADD [
	"This method was automatically generated"
	^ OP_ADD
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_ATOP [
	"This method was automatically generated"
	^ OP_ATOP
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_CLEAR [
	"This method was automatically generated"
	^ OP_CLEAR
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_COLOR [
	"This method was automatically generated"
	^ OP_COLOR
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_COLOR_BURN [
	"This method was automatically generated"
	^ OP_COLOR_BURN
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_COLOR_DODGE [
	"This method was automatically generated"
	^ OP_COLOR_DODGE
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_COUNT [
	"This method was automatically generated"
	^ OP_COUNT
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_DARKEN [
	"This method was automatically generated"
	^ OP_DARKEN
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_DEST_ATOP [
	"This method was automatically generated"
	^ OP_DEST_ATOP
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_DEST_IN [
	"This method was automatically generated"
	^ OP_DEST_IN
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_DEST_OUT [
	"This method was automatically generated"
	^ OP_DEST_OUT
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_DEST_OVER [
	"This method was automatically generated"
	^ OP_DEST_OVER
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_DIFFERENCE [
	"This method was automatically generated"
	^ OP_DIFFERENCE
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_EXCLUSION [
	"This method was automatically generated"
	^ OP_EXCLUSION
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_HARD_LIGHT [
	"This method was automatically generated"
	^ OP_HARD_LIGHT
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_HUE [
	"This method was automatically generated"
	^ OP_HUE
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_IN [
	"This method was automatically generated"
	^ OP_IN
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_LIGHTEN [
	"This method was automatically generated"
	^ OP_LIGHTEN
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_LUMINOSITY [
	"This method was automatically generated"
	^ OP_LUMINOSITY
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_MULTIPLY [
	"This method was automatically generated"
	^ OP_MULTIPLY
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_OUT [
	"This method was automatically generated"
	^ OP_OUT
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_OVER [
	"This method was automatically generated"
	^ OP_OVER
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_OVERLAY [
	"This method was automatically generated"
	^ OP_OVERLAY
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_SATURATION [
	"This method was automatically generated"
	^ OP_SATURATION
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_SCREEN [
	"This method was automatically generated"
	^ OP_SCREEN
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_SOFT_LIGHT [
	"This method was automatically generated"
	^ OP_SOFT_LIGHT
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_SOURCE [
	"This method was automatically generated"
	^ OP_SOURCE
]

{ #category : #'accessing enum' }
MozCompositionOp class >> OP_XOR [
	"This method was automatically generated"
	^ OP_XOR
]

{ #category : #'enum declaration' }
MozCompositionOp class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	OP_OVER 0
	OP_ADD 1
	OP_ATOP 2
	OP_OUT 3
	OP_IN 4
	OP_SOURCE 5
	OP_DEST_IN 6
	OP_DEST_OUT 7
	OP_DEST_OVER 8
	OP_DEST_ATOP 9
	OP_XOR 10
	OP_MULTIPLY 11
	OP_SCREEN 12
	OP_OVERLAY 13
	OP_DARKEN 14
	OP_LIGHTEN 15
	OP_COLOR_DODGE 16
	OP_COLOR_BURN 17
	OP_HARD_LIGHT 18
	OP_SOFT_LIGHT 19
	OP_DIFFERENCE 20
	OP_EXCLUSION 21
	OP_HUE 22
	OP_SATURATION 23
	OP_COLOR 24
	OP_LUMINOSITY 25
	OP_CLEAR 26
	OP_COUNT 27
	)
]

{ #category : #accessing }
MozCompositionOp class >> externalEnum [
	^ 'CompositionOp'
]

{ #category : #accessing }
MozCompositionOp class >> externalType [
	^ FFIInt8 new
]

{ #category : #'class initialization' }
MozCompositionOp class >> initialize [
	super initialize
]
