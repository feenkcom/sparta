"
enum LightingAtts
{
   ATT_POINT_LIGHT_POSITION = 0,                   // Point3D

   ATT_SPOT_LIGHT_POSITION,                           // Point3D
   ATT_SPOT_LIGHT_POINTS_AT,                         // Point3D
   ATT_SPOT_LIGHT_FOCUS,                               // Float
   ATT_SPOT_LIGHT_LIMITING_CONE_ANGLE,          // Float

   ATT_DISTANT_LIGHT_AZIMUTH,                        // Float
   ATT_DISTANT_LIGHT_ELEVATION,                     // Float

   ATT_LIGHTING_COLOR,                                  // Color
   ATT_LIGHTING_SURFACE_SCALE,                      // Float
   ATT_LIGHTING_KERNEL_UNIT_LENGTH,               // Size

   ATT_DIFFUSE_LIGHTING_DIFFUSE_CONSTANT,      // Float

   ATT_SPECULAR_LIGHTING_SPECULAR_CONSTANT,   // Float
   ATT_SPECULAR_LIGHTING_SPECULAR_EXPONENT    // Float
};
"
Class {
	#name : #MozLightingFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_DIFFUSE_LIGHTING_DIFFUSE_CONSTANT',
		'ATT_DISTANT_LIGHT_AZIMUTH',
		'ATT_DISTANT_LIGHT_ELEVATION',
		'ATT_LIGHTING_COLOR',
		'ATT_LIGHTING_KERNEL_UNIT_LENGTH',
		'ATT_LIGHTING_SURFACE_SCALE',
		'ATT_POINT_LIGHT_POSITION',
		'ATT_SPECULAR_LIGHTING_SPECULAR_CONSTANT',
		'ATT_SPECULAR_LIGHTING_SPECULAR_EXPONENT',
		'ATT_SPOT_LIGHT_FOCUS',
		'ATT_SPOT_LIGHT_LIMITING_CONE_ANGLE',
		'ATT_SPOT_LIGHT_POINTS_AT',
		'ATT_SPOT_LIGHT_POSITION'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozLightingFilterAtts class >> ATT_DIFFUSE_LIGHTING_DIFFUSE_CONSTANT [
	"This method was automatically generated"
	^ ATT_DIFFUSE_LIGHTING_DIFFUSE_CONSTANT
]

{ #category : #'accessing enum' }
MozLightingFilterAtts class >> ATT_DISTANT_LIGHT_AZIMUTH [
	"This method was automatically generated"
	^ ATT_DISTANT_LIGHT_AZIMUTH
]

{ #category : #'accessing enum' }
MozLightingFilterAtts class >> ATT_DISTANT_LIGHT_ELEVATION [
	"This method was automatically generated"
	^ ATT_DISTANT_LIGHT_ELEVATION
]

{ #category : #'accessing enum' }
MozLightingFilterAtts class >> ATT_LIGHTING_COLOR [
	"This method was automatically generated"
	^ ATT_LIGHTING_COLOR
]

{ #category : #'accessing enum' }
MozLightingFilterAtts class >> ATT_LIGHTING_KERNEL_UNIT_LENGTH [
	"This method was automatically generated"
	^ ATT_LIGHTING_KERNEL_UNIT_LENGTH
]

{ #category : #'accessing enum' }
MozLightingFilterAtts class >> ATT_LIGHTING_SURFACE_SCALE [
	"This method was automatically generated"
	^ ATT_LIGHTING_SURFACE_SCALE
]

{ #category : #'accessing enum' }
MozLightingFilterAtts class >> ATT_POINT_LIGHT_POSITION [
	"This method was automatically generated"
	^ ATT_POINT_LIGHT_POSITION
]

{ #category : #'accessing enum' }
MozLightingFilterAtts class >> ATT_SPECULAR_LIGHTING_SPECULAR_CONSTANT [
	"This method was automatically generated"
	^ ATT_SPECULAR_LIGHTING_SPECULAR_CONSTANT
]

{ #category : #'accessing enum' }
MozLightingFilterAtts class >> ATT_SPECULAR_LIGHTING_SPECULAR_EXPONENT [
	"This method was automatically generated"
	^ ATT_SPECULAR_LIGHTING_SPECULAR_EXPONENT
]

{ #category : #'accessing enum' }
MozLightingFilterAtts class >> ATT_SPOT_LIGHT_FOCUS [
	"This method was automatically generated"
	^ ATT_SPOT_LIGHT_FOCUS
]

{ #category : #'accessing enum' }
MozLightingFilterAtts class >> ATT_SPOT_LIGHT_LIMITING_CONE_ANGLE [
	"This method was automatically generated"
	^ ATT_SPOT_LIGHT_LIMITING_CONE_ANGLE
]

{ #category : #'accessing enum' }
MozLightingFilterAtts class >> ATT_SPOT_LIGHT_POINTS_AT [
	"This method was automatically generated"
	^ ATT_SPOT_LIGHT_POINTS_AT
]

{ #category : #'accessing enum' }
MozLightingFilterAtts class >> ATT_SPOT_LIGHT_POSITION [
	"This method was automatically generated"
	^ ATT_SPOT_LIGHT_POSITION
]

{ #category : #'enum declaration' }
MozLightingFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		ATT_POINT_LIGHT_POSITION 0 								"Point3D"

		ATT_SPOT_LIGHT_POSITION 1 								"Point3D"
		ATT_SPOT_LIGHT_POINTS_AT 2 								"Point3D"
		ATT_SPOT_LIGHT_FOCUS 3									"Float"
		ATT_SPOT_LIGHT_LIMITING_CONE_ANGLE 4					"Float"

		ATT_DISTANT_LIGHT_AZIMUTH 5								"Float"
		ATT_DISTANT_LIGHT_ELEVATION 6							"Float"

		ATT_LIGHTING_COLOR 7										"Color"
		ATT_LIGHTING_SURFACE_SCALE 8							"Float"
		ATT_LIGHTING_KERNEL_UNIT_LENGTH 9						"Size"

		ATT_DIFFUSE_LIGHTING_DIFFUSE_CONSTANT 10			"Float"

		ATT_SPECULAR_LIGHTING_SPECULAR_CONSTANT 11			"Float"
		ATT_SPECULAR_LIGHTING_SPECULAR_EXPONENT	12			"Float"
	)
]

{ #category : #'class initialization' }
MozLightingFilterAtts class >> initialize [
	self initializeEnumeration
]
