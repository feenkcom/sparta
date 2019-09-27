"
I represent a repetition mode of a Paint.

	CLAMP - Do not repeat
	REPEAT- Repeat in both axis
 	REPEAT_X - Only X axis
 	REPEAT_Y - Only Y axis
 	REFLECT - Mirror the image
"
Class {
	#name : #MozExtendMode,
	#superclass : #MozEnum,
	#classVars : [
		'CLAMP',
		'REFLECT',
		'REPEAT',
		'REPEAT_X',
		'REPEAT_Y'
	],
	#category : 'Sparta-Moz2D-Enums'
}

{ #category : #'accessing enum' }
MozExtendMode class >> CLAMP [
	"This method was automatically generated"
	^ CLAMP
]

{ #category : #'accessing enum' }
MozExtendMode class >> REFLECT [
	"This method was automatically generated"
	^ REFLECT
]

{ #category : #'accessing enum' }
MozExtendMode class >> REPEAT [
	"This method was automatically generated"
	^ REPEAT
]

{ #category : #'accessing enum' }
MozExtendMode class >> REPEAT_X [
	"This method was automatically generated"
	^ REPEAT_X
]

{ #category : #'accessing enum' }
MozExtendMode class >> REPEAT_Y [
	"This method was automatically generated"
	^ REPEAT_Y
]

{ #category : #'enum declaration' }
MozExtendMode class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	CLAMP 0 "Do not repeat"
	REPEAT  1 "Repeat in both axis"
	REPEAT_X 2 "Only X axis"
	REPEAT_Y 3 "Only Y axis"
	REFLECT 4 "Mirror the image"
	)
]

{ #category : #accessing }
MozExtendMode class >> externalEnum [
	^ #ExtendMode
]

{ #category : #accessing }
MozExtendMode class >> externalType [
	^ FFIInt8 new
]

{ #category : #'class initialization' }
MozExtendMode class >> initialize [
	super initialize
]
