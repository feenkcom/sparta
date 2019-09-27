"
enum ColorChannel
{
   COLOR_CHANNEL_R = 0,
   COLOR_CHANNEL_G,
   COLOR_CHANNEL_B,
   COLOR_CHANNEL_A
};
"
Class {
	#name : #MozDisplacementMapFilterColorChannel,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'COLOR_CHANNEL_A',
		'COLOR_CHANNEL_B',
		'COLOR_CHANNEL_G',
		'COLOR_CHANNEL_R'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozDisplacementMapFilterColorChannel class >> COLOR_CHANNEL_A [
	"This method was automatically generated"
	^ COLOR_CHANNEL_A
]

{ #category : #'accessing enum' }
MozDisplacementMapFilterColorChannel class >> COLOR_CHANNEL_B [
	"This method was automatically generated"
	^ COLOR_CHANNEL_B
]

{ #category : #'accessing enum' }
MozDisplacementMapFilterColorChannel class >> COLOR_CHANNEL_G [
	"This method was automatically generated"
	^ COLOR_CHANNEL_G
]

{ #category : #'accessing enum' }
MozDisplacementMapFilterColorChannel class >> COLOR_CHANNEL_R [
	"This method was automatically generated"
	^ COLOR_CHANNEL_R
]

{ #category : #'enum declaration' }
MozDisplacementMapFilterColorChannel class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	COLOR_CHANNEL_R 0
	COLOR_CHANNEL_G 1
	COLOR_CHANNEL_B 2
	COLOR_CHANNEL_A 3
	)
]

{ #category : #'class initialization' }
MozDisplacementMapFilterColorChannel class >> initialize [
	self initializeEnumeration
]
