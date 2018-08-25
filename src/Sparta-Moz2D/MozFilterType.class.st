"
enum class FilterType : int8_t {
  BLEND = 0,
  TRANSFORM,
  MORPHOLOGY,
  COLOR_MATRIX,
  FLOOD,
  TILE,
  TABLE_TRANSFER,
  DISCRETE_TRANSFER,
  LINEAR_TRANSFER,
  GAMMA_TRANSFER,
  CONVOLVE_MATRIX,
  DISPLACEMENT_MAP,
  TURBULENCE,
  ARITHMETIC_COMBINE,
  COMPOSITE,
  DIRECTIONAL_BLUR,
  GAUSSIAN_BLUR,
  POINT_DIFFUSE,
  POINT_SPECULAR,
  SPOT_DIFFUSE,
  SPOT_SPECULAR,
  DISTANT_DIFFUSE,
  DISTANT_SPECULAR,
  CROP,
  PREMULTIPLY,
  UNPREMULTIPLY
};
"
Class {
	#name : #MozFilterType,
	#superclass : #MozEnum,
	#classVars : [
		'ARITHMETIC_COMBINE',
		'BLEND',
		'COLOR_MATRIX',
		'COMPOSITE',
		'CONVOLVE_MATRIX',
		'CROP',
		'DIRECTIONAL_BLUR',
		'DISCRETE_TRANSFER',
		'DISPLACEMENT_MAP',
		'DISTANT_DIFFUSE',
		'DISTANT_SPECULAR',
		'FLOOD',
		'GAMMA_TRANSFER',
		'GAUSSIAN_BLUR',
		'LINEAR_TRANSFER',
		'MORPHOLOGY',
		'POINT_DIFFUSE',
		'POINT_SPECULAR',
		'PREMULTIPLY',
		'SPOT_DIFFUSE',
		'SPOT_SPECULAR',
		'TABLE_TRANSFER',
		'TILE',
		'TRANSFORM',
		'TURBULENCE',
		'UNPREMULTIPLY'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozFilterType class >> ARITHMETIC_COMBINE [
	"This method was automatically generated"
	^ ARITHMETIC_COMBINE
]

{ #category : #'accessing enum' }
MozFilterType class >> BLEND [
	"This method was automatically generated"
	^ BLEND
]

{ #category : #'accessing enum' }
MozFilterType class >> COLOR_MATRIX [
	"This method was automatically generated"
	^ COLOR_MATRIX
]

{ #category : #'accessing enum' }
MozFilterType class >> COMPOSITE [
	"This method was automatically generated"
	^ COMPOSITE
]

{ #category : #'accessing enum' }
MozFilterType class >> CONVOLVE_MATRIX [
	"This method was automatically generated"
	^ CONVOLVE_MATRIX
]

{ #category : #'accessing enum' }
MozFilterType class >> CROP [
	"This method was automatically generated"
	^ CROP
]

{ #category : #'accessing enum' }
MozFilterType class >> DIRECTIONAL_BLUR [
	"This method was automatically generated"
	^ DIRECTIONAL_BLUR
]

{ #category : #'accessing enum' }
MozFilterType class >> DISCRETE_TRANSFER [
	"This method was automatically generated"
	^ DISCRETE_TRANSFER
]

{ #category : #'accessing enum' }
MozFilterType class >> DISPLACEMENT_MAP [
	"This method was automatically generated"
	^ DISPLACEMENT_MAP
]

{ #category : #'accessing enum' }
MozFilterType class >> DISTANT_DIFFUSE [
	"This method was automatically generated"
	^ DISTANT_DIFFUSE
]

{ #category : #'accessing enum' }
MozFilterType class >> DISTANT_SPECULAR [
	"This method was automatically generated"
	^ DISTANT_SPECULAR
]

{ #category : #'accessing enum' }
MozFilterType class >> FLOOD [
	"This method was automatically generated"
	^ FLOOD
]

{ #category : #'accessing enum' }
MozFilterType class >> GAMMA_TRANSFER [
	"This method was automatically generated"
	^ GAMMA_TRANSFER
]

{ #category : #'accessing enum' }
MozFilterType class >> GAUSSIAN_BLUR [
	"This method was automatically generated"
	^ GAUSSIAN_BLUR
]

{ #category : #'accessing enum' }
MozFilterType class >> LINEAR_TRANSFER [
	"This method was automatically generated"
	^ LINEAR_TRANSFER
]

{ #category : #'accessing enum' }
MozFilterType class >> MORPHOLOGY [
	"This method was automatically generated"
	^ MORPHOLOGY
]

{ #category : #'accessing enum' }
MozFilterType class >> POINT_DIFFUSE [
	"This method was automatically generated"
	^ POINT_DIFFUSE
]

{ #category : #'accessing enum' }
MozFilterType class >> POINT_SPECULAR [
	"This method was automatically generated"
	^ POINT_SPECULAR
]

{ #category : #'accessing enum' }
MozFilterType class >> PREMULTIPLY [
	"This method was automatically generated"
	^ PREMULTIPLY
]

{ #category : #'accessing enum' }
MozFilterType class >> SPOT_DIFFUSE [
	"This method was automatically generated"
	^ SPOT_DIFFUSE
]

{ #category : #'accessing enum' }
MozFilterType class >> SPOT_SPECULAR [
	"This method was automatically generated"
	^ SPOT_SPECULAR
]

{ #category : #'accessing enum' }
MozFilterType class >> TABLE_TRANSFER [
	"This method was automatically generated"
	^ TABLE_TRANSFER
]

{ #category : #'accessing enum' }
MozFilterType class >> TILE [
	"This method was automatically generated"
	^ TILE
]

{ #category : #'accessing enum' }
MozFilterType class >> TRANSFORM [
	"This method was automatically generated"
	^ TRANSFORM
]

{ #category : #'accessing enum' }
MozFilterType class >> TURBULENCE [
	"This method was automatically generated"
	^ TURBULENCE
]

{ #category : #'accessing enum' }
MozFilterType class >> UNPREMULTIPLY [
	"This method was automatically generated"
	^ UNPREMULTIPLY
]

{ #category : #'enum declaration' }
MozFilterType class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		BLEND 0
		TRANSFORM 1
		MORPHOLOGY 2
		COLOR_MATRIX 3
		FLOOD 4
		TILE 5
		TABLE_TRANSFER 6
		DISCRETE_TRANSFER 7
		LINEAR_TRANSFER 8
		GAMMA_TRANSFER 9
		CONVOLVE_MATRIX 10
		DISPLACEMENT_MAP 11
		TURBULENCE 12
		ARITHMETIC_COMBINE 13
		COMPOSITE 14
		DIRECTIONAL_BLUR 15
		GAUSSIAN_BLUR 16
		POINT_DIFFUSE 17
		POINT_SPECULAR 18
		SPOT_DIFFUSE 19
		SPOT_SPECULAR 20
		DISTANT_DIFFUSE 21
		DISTANT_SPECULAR 22
		CROP 23
		PREMULTIPLY 24
		UNPREMULTIPLY 25
	)
]

{ #category : #accessing }
MozFilterType class >> externalEnum [
	^ 'FilterType'
]

{ #category : #'class initialization' }
MozFilterType class >> initialize [
	self initializeEnumeration.

	representationType := FFIInt8 new.

	self initializeTest
]
