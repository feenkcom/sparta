"
I make sure that MozDrawOptions work.
DrawOptions is important external structure and must work flawlessly.
"
Class {
	#name : #MozDrawOptionsTest,
	#superclass : #TestCase,
	#instVars : [
		'drawOptions'
	],
	#category : 'Sparta-Moz2D-Tests'
}

{ #category : #running }
MozDrawOptionsTest >> setUp [
	super setUp.

	drawOptions := MozDrawOptions new
]

{ #category : #running }
MozDrawOptionsTest >> tearDown [
	super tearDown.

	drawOptions := nil
]

{ #category : #'tests - alpha' }
MozDrawOptionsTest >> testAlpha [

	drawOptions alpha: 0.
	self assert: drawOptions alpha equals: 0.
	drawOptions alpha: 0.0.
	self assert: drawOptions alpha equals: 0.0.
	
	drawOptions alpha: 1.0.
	self assert: drawOptions alpha equals: 1.
	drawOptions alpha: 1.0.
	self assert: drawOptions alpha equals: 1.0.

	drawOptions alpha: 0.5.
	self assert: drawOptions alpha equals: 0.5.
	drawOptions alpha: 0.5.
	self assert: drawOptions alpha equals: 0.5.
]

{ #category : #'tests - antialias' }
MozDrawOptionsTest >> testAntialiasDefault [

	drawOptions antialiasDefault.

	self assert: drawOptions antialiasMode equals: MozAntialiasMode DEFAULT
]

{ #category : #'tests - antialias' }
MozDrawOptionsTest >> testAntialiasGray [

	drawOptions antialiasGray.

	self assert: drawOptions antialiasMode equals: MozAntialiasMode GRAY
]

{ #category : #'tests - antialias' }
MozDrawOptionsTest >> testAntialiasMode [
	"Smoke test to make sure that all possible antialias modes are settable"
	|modes|
	
	modes := MozAntialiasMode enumerationDictionary
		collect: [ :i | MozAntialiasMode fromInteger: i ].

	modes do: [ :mode |
		drawOptions antialiasMode: mode.
		self assert: drawOptions antialiasMode equals: mode ]
]

{ #category : #'tests - antialias' }
MozDrawOptionsTest >> testAntialiasNone [

	drawOptions antialiasNone.
	
	self assert: drawOptions antialiasMode equals: MozAntialiasMode NONE
]

{ #category : #'tests - antialias' }
MozDrawOptionsTest >> testAntialiasSubpixel [

	drawOptions antialiasSubpixel.

	self assert: drawOptions antialiasMode equals: MozAntialiasMode SUBPIXEL
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeAdd [

	drawOptions composeAdd.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_ADD
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeAtop [

	drawOptions composeAtop.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_ATOP
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeColor [

	drawOptions composeColor.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_COLOR
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeColorBurn [

	drawOptions composeColorBurn.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_COLOR_BURN
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeColorDodge [

	drawOptions composeColorDodge.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_COLOR_DODGE
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeDarken [

	drawOptions composeDarken.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_DARKEN
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeDestAtop [

	drawOptions composeDestAtop.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_DEST_ATOP
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeDestIn [

	drawOptions composeDestIn.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_DEST_IN
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeDestOut [

	drawOptions composeDestOut.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_DEST_OUT
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeDestOver [

	drawOptions composeDestOver.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_DEST_OVER
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeDifference [

	drawOptions composeDifference.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_DIFFERENCE
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeExclusion [

	drawOptions composeExclusion.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_EXCLUSION
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeHardLight [

	drawOptions composeHardLight.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_HARD_LIGHT
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeHue [

	drawOptions composeHue.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_HUE
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeIn [

	drawOptions composeIn.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_IN
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeLighten [

	drawOptions composeLighten.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_LIGHTEN
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeLuminosity [

	drawOptions composeLuminosity.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_LUMINOSITY
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeMultiply [

	drawOptions composeMultiply.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_MULTIPLY
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeOut [

	drawOptions composeOut.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_OUT
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeOver [

	drawOptions composeOver.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_OVER
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeOverlay [

	drawOptions composeOverlay.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_OVERLAY
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeSaturation [

	drawOptions composeSaturation.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_SATURATION
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeScreen [

	drawOptions composeScreen.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_SCREEN
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeSoftLight [

	drawOptions composeSoftLight.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_SOFT_LIGHT
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeSource [

	drawOptions composeSource.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_SOURCE
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testComposeXor [

	drawOptions composeXor.
	
	self assert: drawOptions compositionOperator equals: MozCompositionOp OP_XOR
]

{ #category : #'tests - composition' }
MozDrawOptionsTest >> testCompositionOperator [
	"Smoke test to make sure that all possible composition operators are settable"
	|operators|
	
	operators := MozCompositionOp enumerationDictionary
		collect: [ :i | MozCompositionOp fromInteger: i ].

	operators do: [ :operator |
		drawOptions compositionOperator: operator.
		self assert: drawOptions compositionOperator equals: operator ]
]

{ #category : #'tests - default' }
MozDrawOptionsTest >> testDefault [
	|defaultOptions newOptions |

	defaultOptions := MozDrawOptions cleanUp; default.
	newOptions := MozDrawOptions new.
	
	self assert: defaultOptions alpha equals: 1.
	self assert: defaultOptions antialiasMode equals: MozAntialiasMode DEFAULT.
	self assert: defaultOptions compositionOperator equals: MozCompositionOp OP_OVER.

	self assert: defaultOptions equals: newOptions.
	self assert: defaultOptions hash equals: newOptions hash
]
