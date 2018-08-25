Class {
	#name : #SpartaCairoDrawOptions,
	#superclass : #Object,
	#traits : 'TSpartaDrawOptions',
	#classTraits : 'TSpartaDrawOptions classTrait',
	#instVars : [
		'alpha',
		'antialias',
		'operator'
	],
	#classInstVars : [
		'default'
	],
	#category : 'Sparta-Cairo'
}

{ #category : #cleanup }
SpartaCairoDrawOptions class >> cleanUp [
	super cleanUp.
	
	default := nil
]

{ #category : #accessing }
SpartaCairoDrawOptions class >> default [
	^ default ifNil: [ default := self new ]
]

{ #category : #accessing }
SpartaCairoDrawOptions >> alpha [
	^ alpha
]

{ #category : #accessing }
SpartaCairoDrawOptions >> alpha: aFloat [
	alpha := aFloat
]

{ #category : #accessing }
SpartaCairoDrawOptions >> antialias [
	^ antialias
]

{ #category : #'antialias modes' }
SpartaCairoDrawOptions >> antialiasDefault [
	antialias := SpartaCairoAntialias CAIRO_ANTIALIAS_DEFAULT
]

{ #category : #'antialias modes' }
SpartaCairoDrawOptions >> antialiasGray [
	antialias := SpartaCairoAntialias CAIRO_ANTIALIAS_GRAY
]

{ #category : #'antialias modes' }
SpartaCairoDrawOptions >> antialiasNone [
	antialias := SpartaCairoAntialias CAIRO_ANTIALIAS_NONE
]

{ #category : #'antialias modes' }
SpartaCairoDrawOptions >> antialiasSubpixel [
	antialias := SpartaCairoAntialias CAIRO_ANTIALIAS_SUBPIXEL
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeAdd [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_ADD
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeAtop [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_ATOP
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeClear [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_CLEAR
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeColor [
	SpartaUnsupported signal
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeColorBurn [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_COLOR_BURN
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeColorDodge [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_COLOR_DODGE
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeDarken [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_DARKEN
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeDestAtop [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_DEST_ATOP 
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeDestIn [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_DEST_IN
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeDestOut [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_DEST_OUT
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeDestOver [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_DEST_OVER
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeDifference [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_DIFFERENCE
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeExclusion [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_EXCLUSION
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeHardLight [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_HARD_LIGHT
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeHue [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_HSL_HUE
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeIn [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_IN
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeLighten [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_LIGHTEN
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeLuminosity [
	SpartaUnsupported signal
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeMultiply [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_MULTIPLY
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeOut [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_OUT
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeOver [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_OVER
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeOverlay [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_OVERLAY
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeSaturation [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_SATURATE
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeScreen [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_SCREEN
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeSoftLight [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_SOFT_LIGHT
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeSource [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_SOURCE
]

{ #category : #'composition operators' }
SpartaCairoDrawOptions >> composeXor [
	operator := SpartaCairoCompositionOp CAIRO_OPERATOR_XOR
]

{ #category : #initialization }
SpartaCairoDrawOptions >> initialize [
	super initialize.

	"Setting default values according to backend specification"
	self alpha: 1.
	self antialiasDefault.
	self composeOver
]

{ #category : #accessing }
SpartaCairoDrawOptions >> operator [
	^ operator
]
