"
I represent a type of font family name, either a name (e.g. Helvetica) or a generic (e.g. serif, sans-serif), with the ability to distinguish between unquoted and quoted names for serializaiton

Example:
	
	MozFontFamilyType sansSerif
"
Class {
	#name : #MozFontFamilyType,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'cursive',
		'fantasy',
		'fixed',
		'monospace',
		'named',
		'namedQuoted',
		'none',
		'sansSerif',
		'serif',
		'special',
		'variable'
	],
	#category : 'Sparta-Moz2D-Text'
}

{ #category : #'accessing enum' }
MozFontFamilyType class >> cursive [
	"This method was automatically generated"
	^ cursive
]

{ #category : #'enum declaration' }
MozFontFamilyType class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	none 0  "used when finding generics"

	"explicitly named font family (e.g. Helvetica)"
	named 1
	namedQuoted 2

	"generics"
	serif 3         "pref font code relies on this ordering!!!"
	sansSerif 4
	monospace 5
	cursive 6
	fantasy 7

	special 8
	variable 9
	fixed 10
	)
]

{ #category : #'accessing enum' }
MozFontFamilyType class >> fantasy [
	"This method was automatically generated"
	^ fantasy
]

{ #category : #'accessing enum' }
MozFontFamilyType class >> fixed [
	"This method was automatically generated"
	^ fixed
]

{ #category : #'class initialization' }
MozFontFamilyType class >> initialize [
	self initializeEnumeration
]

{ #category : #'accessing enum' }
MozFontFamilyType class >> monospace [
	"This method was automatically generated"
	^ monospace
]

{ #category : #'accessing enum' }
MozFontFamilyType class >> named [
	"This method was automatically generated"
	^ named
]

{ #category : #'accessing enum' }
MozFontFamilyType class >> namedQuoted [
	"This method was automatically generated"
	^ namedQuoted
]

{ #category : #'accessing enum' }
MozFontFamilyType class >> none [
	"This method was automatically generated"
	^ none
]

{ #category : #'accessing enum' }
MozFontFamilyType class >> sansSerif [
	"This method was automatically generated"
	^ sansSerif
]

{ #category : #'accessing enum' }
MozFontFamilyType class >> serif [
	"This method was automatically generated"
	^ serif
]

{ #category : #'accessing enum' }
MozFontFamilyType class >> special [
	"This method was automatically generated"
	^ special
]

{ #category : #'accessing enum' }
MozFontFamilyType class >> variable [
	"This method was automatically generated"
	^ variable
]
