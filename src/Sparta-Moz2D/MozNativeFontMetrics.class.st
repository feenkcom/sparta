Class {
	#name : #MozNativeFontMetrics,
	#superclass : #FFIExternalStructure,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#classVars : [
		'OFFSET_AVECHARWIDTH',
		'OFFSET_CAPHEIGHT',
		'OFFSET_EMASCENT',
		'OFFSET_EMDESCENT',
		'OFFSET_EMHEIGHT',
		'OFFSET_EXTERNALLEADING',
		'OFFSET_INTERNALLEADING',
		'OFFSET_MAXADVANCE',
		'OFFSET_MAXASCENT',
		'OFFSET_MAXDESCENT',
		'OFFSET_MAXHEIGHT',
		'OFFSET_SPACEWIDTH',
		'OFFSET_STRIKEOUTOFFSET',
		'OFFSET_STRIKEOUTSIZE',
		'OFFSET_UNDERLINEOFFSET',
		'OFFSET_UNDERLINESIZE',
		'OFFSET_XHEIGHT',
		'OFFSET_ZEROORAVECHARWIDTH'
	],
	#category : #'Sparta-Moz2D-External'
}

{ #category : #converting }
MozNativeFontMetrics class >> asExternalTypeOn: generator [
	"use handle ivar to hold my instance"
	^ FFIExternalObjectType objectClass: self
]

{ #category : #'library path' }
MozNativeFontMetrics class >> ffiLibraryName [
	^ MozLibrary
]

{ #category : #'field definition' }
MozNativeFontMetrics class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
		double capHeight;
		double xHeight;
		double strikeoutSize;
		double strikeoutOffset;
		double underlineSize;
		double underlineOffset;

		double internalLeading;
		double externalLeading;

		double emHeight;
		double emAscent;
		double emDescent;
		double maxHeight;
		double maxAscent;
		double maxDescent;
		double maxAdvance;

		double aveCharWidth;
		double spaceWidth;
		double zeroOrAveCharWidth;
	)
]

{ #category : #converting }
MozNativeFontMetrics >> asFontMetrics [
	^ SpartaFontMetrics new mozInitializeFrom: self
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> aveCharWidth [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_AVECHARWIDTH
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> aveCharWidth: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_AVECHARWIDTH put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> capHeight [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_CAPHEIGHT
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> capHeight: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_CAPHEIGHT put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> emAscent [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_EMASCENT
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> emAscent: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_EMASCENT put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> emDescent [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_EMDESCENT
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> emDescent: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_EMDESCENT put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> emHeight [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_EMHEIGHT
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> emHeight: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_EMHEIGHT put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> externalLeading [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_EXTERNALLEADING
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> externalLeading: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_EXTERNALLEADING put: anObject
]

{ #category : #'library path' }
MozNativeFontMetrics >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> internalLeading [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_INTERNALLEADING
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> internalLeading: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_INTERNALLEADING put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> maxAdvance [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_MAXADVANCE
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> maxAdvance: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_MAXADVANCE put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> maxAscent [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_MAXASCENT
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> maxAscent: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_MAXASCENT put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> maxDescent [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_MAXDESCENT
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> maxDescent: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_MAXDESCENT put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> maxHeight [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_MAXHEIGHT
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> maxHeight: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_MAXHEIGHT put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> spaceWidth [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_SPACEWIDTH
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> spaceWidth: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_SPACEWIDTH put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> strikeoutOffset [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_STRIKEOUTOFFSET
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> strikeoutOffset: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_STRIKEOUTOFFSET put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> strikeoutSize [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_STRIKEOUTSIZE
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> strikeoutSize: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_STRIKEOUTSIZE put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> underlineOffset [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_UNDERLINEOFFSET
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> underlineOffset: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_UNDERLINEOFFSET put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> underlineSize [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_UNDERLINESIZE
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> underlineSize: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_UNDERLINESIZE put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> xHeight [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_XHEIGHT
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> xHeight: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_XHEIGHT put: anObject
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> zeroOrAveCharWidth [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_ZEROORAVECHARWIDTH
]

{ #category : #'accessing structure variables' }
MozNativeFontMetrics >> zeroOrAveCharWidth: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_ZEROORAVECHARWIDTH put: anObject
]
