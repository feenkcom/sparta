Class {
	#name : #MozTextMetricsProvider,
	#superclass : #SpartaMetricsProvider,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#instVars : [
		'textMetrics',
		'fontMetrics',
		'session'
	],
	#classVars : [
		'Nullptr'
	],
	#classInstVars : [
		'default'
	],
	#category : #'Sparta-Moz2D-Text-Metrics'
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

{ #category : #'library path' }
MozTextMetricsProvider >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #finalization }
MozTextMetricsProvider >> finalize [
	self finalizeTextMetrics.
	self finalizeFontMetrics.
	
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
MozTextMetricsProvider >> finalizeTextMetrics [
	"Free space allocated for text metrics structure"

	(textMetrics isNotNil and: [ textMetrics isNull not ])
		ifTrue: [ textMetrics free ].
	textMetrics := nil
]

{ #category : #initialization }
MozTextMetricsProvider >> initialize [
	super initialize.
	
	session := Smalltalk session.

	self initializeTextMetrics.
	self initializeFontMetrics.

	self autoRelease
]

{ #category : #initialization }
MozTextMetricsProvider >> initializeFontMetrics [

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

{ #category : #initialization }
MozTextMetricsProvider >> initializeTextMetrics [

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

{ #category : #testing }
MozTextMetricsProvider >> isValid [
	"Return true if I am a valid metrics provider, false otherwise"
	<return: #Boolean>

	^ session == Smalltalk session
]

{ #category : #measurement }
MozTextMetricsProvider >> measure: aTextRun in: aMetrics [
	| aCanvas |
	self
		assert: [ aTextRun isNotNil ]
		description: [ 'Text run to measure must not be nil' ].

	aCanvas := aMetrics canvas.
	
	self
		primMeasure: aTextRun
		s: 0
		l: 4294967295
		b: false
		w: 4294967295
		p: Nullptr
		s: MozTextSuppressBreak eSuppressAllBreaks
		w: Nullptr
		m: textMetrics "computed text metrics will be loaded in textMetrics"
		b: MozTextBoundingBoxType TIGHT_INK_EXTENTS
		c: aCanvas
		h: Nullptr
		l: Nullptr
		w: false
		b: Nullptr.

	aMetrics textMetrics: textMetrics asTextMetrics.
	
	self primFontMetrics: fontMetrics textRun: aTextRun.
	aMetrics fontMetrics: fontMetrics asFontMetrics
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
		ExternalAddress aProvider,
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
