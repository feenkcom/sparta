Class {
	#name : #MozTextFlags,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'TEXT_ENABLE_HYPHEN_BREAKS',
		'TEXT_ENABLE_SPACING',
		'TEXT_IS_ASCII',
		'TEXT_IS_PERSISTENT',
		'TEXT_IS_RTL',
		'TEXT_NEED_BOUNDING_BOX'
	],
	#category : 'Sparta-Moz2D-Text-Enums'
}

{ #category : #'accessing enum' }
MozTextFlags class >> TEXT_ENABLE_HYPHEN_BREAKS [
	"This method was automatically generated"
	^ TEXT_ENABLE_HYPHEN_BREAKS
]

{ #category : #'accessing enum' }
MozTextFlags class >> TEXT_ENABLE_SPACING [
	"This method was automatically generated"
	^ TEXT_ENABLE_SPACING
]

{ #category : #'accessing enum' }
MozTextFlags class >> TEXT_IS_ASCII [
	"This method was automatically generated"
	^ TEXT_IS_ASCII
]

{ #category : #'accessing enum' }
MozTextFlags class >> TEXT_IS_PERSISTENT [
	"This method was automatically generated"
	^ TEXT_IS_PERSISTENT
]

{ #category : #'accessing enum' }
MozTextFlags class >> TEXT_IS_RTL [
	"This method was automatically generated"
	^ TEXT_IS_RTL
]

{ #category : #'accessing enum' }
MozTextFlags class >> TEXT_NEED_BOUNDING_BOX [
	"This method was automatically generated"
	^ TEXT_NEED_BOUNDING_BOX
]

{ #category : #'enum declaration' }
MozTextFlags class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		TEXT_IS_PERSISTENT 			16r0001
		TEXT_IS_ASCII 					16r0002
		TEXT_IS_RTL 						16r0004
		TEXT_ENABLE_SPACING 			16r0008
		TEXT_ENABLE_HYPHEN_BREAKS 	16r0010
		TEXT_NEED_BOUNDING_BOX 		16r0040
	)
]

{ #category : #'class initialization' }
MozTextFlags class >> initialize [
	self initializeEnumeration
]
