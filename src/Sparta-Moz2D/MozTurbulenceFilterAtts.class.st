"
enum TurbulenceAtts
{
   ATT_TURBULENCE_BASE_FREQUENCY = 0,            // Size
   ATT_TURBULENCE_NUM_OCTAVES,                      // uint32_t
   ATT_TURBULENCE_SEED,                                 // uint32_t
   ATT_TURBULENCE_STITCHABLE,                        // bool
   ATT_TURBULENCE_TYPE,                                 // TurbulenceType
   ATT_TURBULENCE_RECT                                  // IntRect
};
"
Class {
	#name : #MozTurbulenceFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_TURBULENCE_BASE_FREQUENCY',
		'ATT_TURBULENCE_NUM_OCTAVES',
		'ATT_TURBULENCE_RECT',
		'ATT_TURBULENCE_SEED',
		'ATT_TURBULENCE_STITCHABLE',
		'ATT_TURBULENCE_TYPE'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozTurbulenceFilterAtts class >> ATT_TURBULENCE_BASE_FREQUENCY [
	"This method was automatically generated"
	^ ATT_TURBULENCE_BASE_FREQUENCY
]

{ #category : #'accessing enum' }
MozTurbulenceFilterAtts class >> ATT_TURBULENCE_NUM_OCTAVES [
	"This method was automatically generated"
	^ ATT_TURBULENCE_NUM_OCTAVES
]

{ #category : #'accessing enum' }
MozTurbulenceFilterAtts class >> ATT_TURBULENCE_RECT [
	"This method was automatically generated"
	^ ATT_TURBULENCE_RECT
]

{ #category : #'accessing enum' }
MozTurbulenceFilterAtts class >> ATT_TURBULENCE_SEED [
	"This method was automatically generated"
	^ ATT_TURBULENCE_SEED
]

{ #category : #'accessing enum' }
MozTurbulenceFilterAtts class >> ATT_TURBULENCE_STITCHABLE [
	"This method was automatically generated"
	^ ATT_TURBULENCE_STITCHABLE
]

{ #category : #'accessing enum' }
MozTurbulenceFilterAtts class >> ATT_TURBULENCE_TYPE [
	"This method was automatically generated"
	^ ATT_TURBULENCE_TYPE
]

{ #category : #'enum declaration' }
MozTurbulenceFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	ATT_TURBULENCE_BASE_FREQUENCY 0  "Size"
	ATT_TURBULENCE_NUM_OCTAVES 1     "uint32_t"
	ATT_TURBULENCE_SEED 2            "uint32_t"
	ATT_TURBULENCE_STITCHABLE 3      "bool"
	ATT_TURBULENCE_TYPE 4            "TurbulenceType"
	ATT_TURBULENCE_RECT 5            "IntRect"
	)
]

{ #category : #'class initialization' }
MozTurbulenceFilterAtts class >> initialize [
	self initializeEnumeration
]
