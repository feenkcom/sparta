Class {
	#name : #MozAntialiasMode,
	#superclass : #MozEnum,
	#classVars : [
		'DEFAULT',
		'GRAY',
		'NONE',
		'SUBPIXEL'
	],
	#category : 'Sparta-Moz2D-Enums'
}

{ #category : #'accessing enum' }
MozAntialiasMode class >> DEFAULT [
	"This method was automatically generated"
	^ DEFAULT
]

{ #category : #'accessing enum' }
MozAntialiasMode class >> GRAY [
	"This method was automatically generated"
	^ GRAY
]

{ #category : #'accessing enum' }
MozAntialiasMode class >> NONE [
	"This method was automatically generated"
	^ NONE
]

{ #category : #'accessing enum' }
MozAntialiasMode class >> SUBPIXEL [
	"This method was automatically generated"
	^ SUBPIXEL
]

{ #category : #'enum declaration' }
MozAntialiasMode class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	NONE 0
	GRAY 1
	SUBPIXEL 2
	DEFAULT 3
	)
]

{ #category : #accessing }
MozAntialiasMode class >> externalEnum [
	^ #AntialiasMode
]

{ #category : #accessing }
MozAntialiasMode class >> externalType [
	^ FFIInt8 new
]

{ #category : #'class initialization' }
MozAntialiasMode class >> initialize [
	super initialize
]
