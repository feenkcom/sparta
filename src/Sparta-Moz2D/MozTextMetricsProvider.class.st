Class {
	#name : #MozTextMetricsProvider,
	#superclass : #SpMetricsProvider,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#instVars : [
		'trimWhitespace',
		'textMetrics',
		'propertyProvider',
		'lastBreak',
		'fontMetrics',
		'usedHyphenation',
		'session'
	],
	#classVars : [
		'Nullptr'
	],
	#classInstVars : [
		'default'
	],
	#category : 'Sparta-Moz2D-Text-Metrics'
}

{ #category : #cleanup }
MozTextMetricsProvider class >> cleanUp [
	super cleanUp.
	
	default := nil
]

{ #category : #accessing }
MozTextMetricsProvider class >> default [
	^ default
		ifNil: [ default := self new ]
		ifNotNil: [ :aProvider | aProvider isValid
			ifTrue: [ aProvider ]
			ifFalse: [ default := self new ] ]
]

{ #category : #'library path' }
MozTextMetricsProvider class >> ffiLibraryName [
	^ MozLibrary
]

{ #category : #initialization }
MozTextMetricsProvider class >> initialize [
	super initialize.
	
	Nullptr := ExternalAddress null
]

{ #category : #'external resource management' }
MozTextMetricsProvider >> autoRelease [
	^ self class finalizationRegistry add: self
]

{ #category : #'advanced options' }
MozTextMetricsProvider >> disableFontMetrics [

	fontMetrics := MozNativeFontMetrics externalNew.
	fontMetrics free
]

{ #category : #'advanced options' }
MozTextMetricsProvider >> disableTextMetrics [

	textMetrics := MozNativeTextMetrics externalNew.
	textMetrics free
]

{ #category : #'advanced options' }
MozTextMetricsProvider >> enableFontMetrics [

	fontMetrics := MozNativeFontMetrics externalNew.
	fontMetrics
		aveCharWidth: 0;
		emAscent: 0;
		emDescent: 0;
		emHeight: 0;
		externalLeading: 0;
		internalLeading: 0;
		maxAdvance: 0;
		maxAscent: 0;
		maxDescent: 0;
		maxHeight: 0;
		spaceWidth: 0;
		strikeoutOffset: 0;
		strikeoutSize: 0;
		underlineOffset: 0;
		underlineSize: 0;
		xHeight: 0;
		zeroOrAveCharWidth: 0
]

{ #category : #'advanced options' }
MozTextMetricsProvider >> enablePropertyProvider [
	"Note, property provider is not 'autoRelease'd.
	Memory management is done on the level of metrics provider"

	propertyProvider := MozTextPropertyProvider new
]

{ #category : #'advanced options' }
MozTextMetricsProvider >> enableTextMetrics [

	textMetrics := MozNativeTextMetrics externalNew.
	textMetrics
		advanceWidth: 0;
		ascent: 0;
		boundingBoxHeight: 0;
		boundingBoxWidth: 0;
		boundingBoxX: 0;
		boundingBoxY: 0;
		descent: 0
]

{ #category : #'library path' }
MozTextMetricsProvider >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #finalization }
MozTextMetricsProvider >> finalize [
	
	self finalizeLastBreak.
	self finalizeTrimWhitespace.
	self finalizeUsedHyphenation.
	self finalizeTextMetrics.
	self finalizeFontMetrics.
	self finalizePropertyProvider.
	
	session := nil
]

{ #category : #finalization }
MozTextMetricsProvider >> finalizeFontMetrics [
	"Free space allocated for font metrics structure"

	(fontMetrics isNotNil and: [ fontMetrics isNull not ])
		ifTrue: [ fontMetrics free ].
	fontMetrics := nil
]

{ #category : #finalization }
MozTextMetricsProvider >> finalizeLastBreak [
	"Free space allocated for last break, used during measurement process"

	(lastBreak isNotNil and: [ lastBreak isNull not ])
		ifTrue: [ lastBreak free ].
	lastBreak := nil
]

{ #category : #finalization }
MozTextMetricsProvider >> finalizePropertyProvider [
	"Release property provider property.
	Note: property provider supports smart pointer with counter,
	so it is ok to pass it to Moz2D external functions"

	propertyProvider 
		ifNotNil: [ :aPropertyProvider | aPropertyProvider release ].
	propertyProvider := nil
]

{ #category : #finalization }
MozTextMetricsProvider >> finalizeTextMetrics [
	"Free space allocated for text metrics structure"

	(textMetrics isNotNil and: [ textMetrics isNull not ])
		ifTrue: [ textMetrics free ].
	textMetrics := nil
]

{ #category : #finalization }
MozTextMetricsProvider >> finalizeTrimWhitespace [
	"Free space allocated for trimmed whitespace, used during measurement process"

	(trimWhitespace isNotNil and: [ trimWhitespace isNull not ])
		ifTrue: [ trimWhitespace free ].
	trimWhitespace := nil
]

{ #category : #finalization }
MozTextMetricsProvider >> finalizeUsedHyphenation [
	"Free space allocated for used hyphenation, used during measurement process"

	(usedHyphenation isNotNil and: [ usedHyphenation isNull not ])
		ifTrue: [ usedHyphenation free ].
	usedHyphenation := nil
]

{ #category : #'accessing - metrics' }
MozTextMetricsProvider >> fontMetrics [
	^ fontMetrics
]

{ #category : #'advanced options' }
MozTextMetricsProvider >> ignoreLastBreak [
	lastBreak := ExternalAddress allocate: (FFIUInt32 externalTypeSize).
	lastBreak free
]

{ #category : #'advanced options' }
MozTextMetricsProvider >> ignoreTrimmedWhitespace [
	trimWhitespace := nil
]

{ #category : #'advanced options' }
MozTextMetricsProvider >> ignoreUsedHyphenation [
	usedHyphenation := ExternalAddress allocate: (FFIBool externalTypeSize).
	usedHyphenation free
]

{ #category : #initialization }
MozTextMetricsProvider >> initialize [
	super initialize.
	
	session := Smalltalk session.

	self enableTextMetrics.
	self enableFontMetrics.
	self enablePropertyProvider.
	self recordLastBreak.
	self recordUsedHyphenation.
	self ignoreTrimmedWhitespace.

	self autoRelease
]

{ #category : #testing }
MozTextMetricsProvider >> isValid [
	"Return true if I am a valid metrics provider, false otherwise"
	<return: #Boolean>

	^ session == Smalltalk session
]

{ #category : #'accessing - metrics' }
MozTextMetricsProvider >> lastBreak [

	^ lastBreak isNull
		ifTrue: [ SmallInteger maxVal ]
		ifFalse: [ lastBreak unsignedLongAt: 1 ]
]

{ #category : #measurement }
MozTextMetricsProvider >> measure: aTextRun in: aMetrics [

	self
		assert: [ aTextRun isNotNil ]
		description: [ 'Text run to measure must not be nil' ].

	"We measure text only if it is requested"
	aMetrics measureText ifTrue: [
		| aBreakPriorityPointer aPropertyProvider aStart aLength aWidth aLineBreakBefore aSpacing aBreakPriority aBoxType aCanvas aWordWrap aSuppressBreaks aWrappedLength |

		"In C++ array index starts from 0"
		aStart := (aMetrics start - 1) max: 0.
		aLength := aMetrics length min: 4294967295. "limit to max of uint32"
		aWidth := aMetrics width.
		aLineBreakBefore := aMetrics lineBreakBefore.
		aBreakPriority := aMetrics breakPriority.
		aSuppressBreaks := aMetrics suppressBreaks.
		aSpacing := aMetrics spacing.
		aBoxType := aMetrics boxType.
		aCanvas := aMetrics canvas.
		aWordWrap := aBreakPriority canWrapWord.

		aBreakPriorityPointer := ExternalAddress allocate: FFIUInt32 externalTypeSize.
		aBreakPriorityPointer unsignedLongAt: 1 put: aBreakPriority value.

		"Choose which property provider we want to use. Users may provide
		a custom property provider in the request.
		If it is not provided we use default one"
		aPropertyProvider := aMetrics propertyProvider.
		aPropertyProvider ifNil: [ aPropertyProvider := propertyProvider ].

		self
			assert: [ aPropertyProvider isNotNil ]
			description: [ 'Property provider used for measurement must not be nil!' ].

		"Next we need to pre-configure property provider according to request"
		aPropertyProvider spacing: aSpacing.
		aPropertyProvider breakPriority: aBreakPriority.
		aPropertyProvider textRun: aTextRun.
		
		aWrappedLength := self
			primMeasure: aTextRun
			s: aStart
			l: aLength
			b: aLineBreakBefore
			w: aWidth
			p: aPropertyProvider
			s: aSuppressBreaks
			w: trimWhitespace
			m: textMetrics "computed text metrics will be loaded in textMetrics"
			b: aBoxType
			c: aCanvas
			h: usedHyphenation
			l: lastBreak
			w: aWordWrap
			b: aBreakPriorityPointer.
		
		"text run is measured, clean state"
		aPropertyProvider textRun: nil.
		aBreakPriorityPointer free.
	
		aMetrics wrappedLength: aWrappedLength.
		aMetrics textMetrics: textMetrics asTextMetrics ].

	"We measure font only if it is requested"
	aMetrics measureFont ifTrue: [
		self primFontMetrics: fontMetrics textRun: aTextRun.
		aMetrics fontMetrics: fontMetrics asFontMetrics ]
]

{ #category : #'private - ffi' }
MozTextMetricsProvider >> primFontMetrics: aMetrics textRun: aTextRun [

	^ self ffiCall: #(void moz2d_text_run_font_metrics (
		MozTextRun aTextRun,
		MozNativeFontMetrics aMetrics) )
]

{ #category : #'private - ffi' }
MozTextMetricsProvider >> primMeasure: aTextRun s: aStart l: aMaxLength b: aLineBreakBefore w: aWidth p: aProvider s: aSuppressBreak w: aTrimWhitespace m: aMetrics b: aBoundingBoxType c: aCanvas h: aUsedHyphenation l: aLastBreak w: aCanWordWrap b: aBreakPriorityPointer [
	"My orignal method name was:
	
	primMeasure: aTextRun start: aStart length: aMaxLength breakBefore: aLineBreakBefore width: aWidth provider: aProvider suppress: aSuppressBreak whitespace: aTrimWhitespace metrics: aMetrics boxType: aBoundingBoxType canvas: aCanvas hyphen: aUsedHyphenation lastBreak: aLastBreak wordWrap: aCanWordWrap breakPriority: aBreakPriorityPointer
	
	However, windows does not support long path, so we had to rename it to a shorter version...
	See http://forum.world.st/A-better-way-to-serialise-methods-td4952814.html
	"

	^ self ffiCall: #(uint32 moz2d_text_run_break_and_measure (
		MozTextRun aTextRun,
		uint32 aStart,
		uint32 aMaxLength,
		bool aLineBreakBefore,
		double aWidth,
		MozTextPropertyProvider aProvider,
		MozTextSuppressBreak aSuppressBreak,
		ExternalAddress aTrimWhitespace,
		MozNativeTextMetrics aMetrics,
		MozTextBoundingBoxType aBoundingBoxType,
		MozCanvas aCanvas,
		ExternalAddress aUsedHyphenation,
		ExternalAddress aLastBreak,
		bool aCanWordWrap,
		ExternalAddress aBreakPriorityPointer))
]

{ #category : #'private - ffi' }
MozTextMetricsProvider >> primSet: aPropertyProvider hyphensOption: aHyphensOption [

	^ self ffiCall: #(void moz2d_text_run_property_provider_set_hyphens_option (
		MozTextPropertyProvider aPropertyProvider,
		MozTextHyphensOption aHyphensOption ) )
]

{ #category : #accessing }
MozTextMetricsProvider >> propertyProvider [
	^ propertyProvider
]

{ #category : #'advanced options' }
MozTextMetricsProvider >> recordLastBreak [
	lastBreak := ExternalAddress allocate: (FFIUInt32 externalTypeSize).
	lastBreak unsignedLongAt: 1 put: 4294967295 "uint32 maxValue"
]

{ #category : #'advanced options' }
MozTextMetricsProvider >> recordTrimmedWhitespace [
	trimWhitespace := ExternalAddress allocate: FFIFloat64 externalTypeSize.
	trimWhitespace doubleAt: 1 put: 0
]

{ #category : #'advanced options' }
MozTextMetricsProvider >> recordUsedHyphenation [
	usedHyphenation := ExternalAddress allocate: (FFIBool externalTypeSize).
	usedHyphenation booleanAt: 1 put: false
]

{ #category : #'accessing - metrics' }
MozTextMetricsProvider >> textMetrics [
	"Return text metrics.
	Note, that you must never strong refer returned text metrics, because it is
	an external object and memory is managed by TextMetricsProvider manually for
	performance reasons."

	^ textMetrics
]

{ #category : #'accessing - metrics' }
MozTextMetricsProvider >> trimmedWhiteSpace [
	"Return the width of the trimmed spaces will be returned in aTrimWhitespace."
	^ trimWhitespace isNull
		ifTrue: [ 0 ]
		ifFalse: [ trimWhitespace doubleAt: 1 ]
]

{ #category : #'accessing - metrics' }
MozTextMetricsProvider >> usedHyphenation [

	^ usedHyphenation isNull
		ifTrue: [ false ]
		ifFalse: [ usedHyphenation booleanAt: 1 ]
]
