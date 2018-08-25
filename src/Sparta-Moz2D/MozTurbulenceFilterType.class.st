"
enum TurbulenceType
{
   TURBULENCE_TYPE_TURBULENCE = 0,
   TURBULENCE_TYPE_FRACTAL_NOISE
};
"
Class {
	#name : #MozTurbulenceFilterType,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'TURBULENCE_TYPE_FRACTAL_NOISE',
		'TURBULENCE_TYPE_TURBULENCE'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozTurbulenceFilterType class >> TURBULENCE_TYPE_FRACTAL_NOISE [
	"This method was automatically generated"
	^ TURBULENCE_TYPE_FRACTAL_NOISE
]

{ #category : #'accessing enum' }
MozTurbulenceFilterType class >> TURBULENCE_TYPE_TURBULENCE [
	"This method was automatically generated"
	^ TURBULENCE_TYPE_TURBULENCE
]

{ #category : #'enum declaration' }
MozTurbulenceFilterType class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	TURBULENCE_TYPE_TURBULENCE 0
	TURBULENCE_TYPE_FRACTAL_NOISE 1
	)
]

{ #category : #'class initialization' }
MozTurbulenceFilterType class >> initialize [
	self initializeEnumeration
]
