"
enum DisplacementMapAtts
{
   ATT_DISPLACEMENT_MAP_SCALE = 0,                // Float
   ATT_DISPLACEMENT_MAP_X_CHANNEL,                // ColorChannel
   ATT_DISPLACEMENT_MAP_Y_CHANNEL                  // ColorChannel
};
"
Class {
	#name : #MozDisplacementMapFilterAtts,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ATT_DISPLACEMENT_MAP_SCALE',
		'ATT_DISPLACEMENT_MAP_X_CHANNEL',
		'ATT_DISPLACEMENT_MAP_Y_CHANNEL'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozDisplacementMapFilterAtts class >> ATT_DISPLACEMENT_MAP_SCALE [
	"This method was automatically generated"
	^ ATT_DISPLACEMENT_MAP_SCALE
]

{ #category : #'accessing enum' }
MozDisplacementMapFilterAtts class >> ATT_DISPLACEMENT_MAP_X_CHANNEL [
	"This method was automatically generated"
	^ ATT_DISPLACEMENT_MAP_X_CHANNEL
]

{ #category : #'accessing enum' }
MozDisplacementMapFilterAtts class >> ATT_DISPLACEMENT_MAP_Y_CHANNEL [
	"This method was automatically generated"
	^ ATT_DISPLACEMENT_MAP_Y_CHANNEL
]

{ #category : #'enum declaration' }
MozDisplacementMapFilterAtts class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	ATT_DISPLACEMENT_MAP_SCALE 0 "Float"
	ATT_DISPLACEMENT_MAP_X_CHANNEL 1 "ColorChannel"
	ATT_DISPLACEMENT_MAP_Y_CHANNEL	2 "ColorChannel"
	)
]

{ #category : #'class initialization' }
MozDisplacementMapFilterAtts class >> initialize [
	self initializeEnumeration
]
