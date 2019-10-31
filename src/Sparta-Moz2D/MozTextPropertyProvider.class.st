Class {
	#name : #MozTextPropertyProvider,
	#superclass : #FFIExternalObject,
	#traits : 'TMozLibrary + TMozPlainPtr + TMozDebug + TSpTextPropertiesProvider',
	#classTraits : 'TMozLibrary classTrait + TMozPlainPtr classTrait + TMozDebug classTrait + TSpTextPropertiesProvider classTrait',
	#instVars : [
		'spacing',
		'breakPriority',
		'textRun',
		'canvas',
		'hyphenWidth'
	],
	#classInstVars : [
		'instances',
		'session'
	],
	#category : 'Sparta-Moz2D-Text-Metrics'
}

{ #category : #cleanup }
MozTextPropertyProvider class >> cleanUp [
	super cleanUp.
	
	instances := nil.
	session := nil.
]

{ #category : #'library path' }
MozTextPropertyProvider class >> ffiLibraryName [
	^ MozLibrary
]

{ #category : #finalization }
MozTextPropertyProvider class >> finalizeResourceData: aHandle [
	
	self release: aHandle
]

{ #category : #accessing }
MozTextPropertyProvider class >> fromIdentityHash: aNumber [
	"Return a text property provider for provided itentity hash.
	If there is no such instance return nil"
	<return: #MozTextPropertyProvider>

	^ self instances
		at: aNumber
		ifAbsent: nil
]

{ #category : #accessing }
MozTextPropertyProvider class >> instances [
	session == Smalltalk session
		ifFalse: [
			instances := nil.
			session := Smalltalk session ].

	^ instances ifNil: [ instances := WeakValueDictionary new ]
]

{ #category : #'instance creation' }
MozTextPropertyProvider class >> new [
	| aHandle aPropertyProvider |
	aPropertyProvider := self basicNew.
	aHandle := self primCreate: aPropertyProvider identityHash.
	aPropertyProvider setHandle: aHandle.
	aPropertyProvider initialize.
	self instances at: aPropertyProvider identityHash put: aPropertyProvider.
	^ aPropertyProvider
]

{ #category : #'private - ffi' }
MozTextPropertyProvider class >> primCreate: aHash [

	^ self ffiCall: #(void* moz2d_text_run_property_provider_create(ulong aHash))
]

{ #category : #'private - ffi' }
MozTextPropertyProvider class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	^ self ffiCall: #(void moz2d_text_run_property_provider_delete (void* aHandle))
]

{ #category : #accessing }
MozTextPropertyProvider >> appUnitsPerDevUnit [
	^ 1
]

{ #category : #accessing }
MozTextPropertyProvider >> breakPriority [
	^ breakPriority
]

{ #category : #accessing }
MozTextPropertyProvider >> breakPriority: aBreakPriority [
	breakPriority := aBreakPriority.
	
	"Precompute and store hyphens option in external structure for performance reason"
	self primSetHyphensOption: self hyphensOption
]

{ #category : #accessing }
MozTextPropertyProvider >> canvas [
	"Return a canvas that is used to compute a bounding box of a string"
	<return: #SpartaCanvas>

	^ canvas
]

{ #category : #accessing }
MozTextPropertyProvider >> canvas: aCanvas [

	canvas := aCanvas
]

{ #category : #'library path' }
MozTextPropertyProvider >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #accessing }
MozTextPropertyProvider >> hyphenWidth [
	^ hyphenWidth
]

{ #category : #accessing }
MozTextPropertyProvider >> hyphenWidth: aNumber [
	hyphenWidth := aNumber asFloat
]

{ #category : #accessing }
MozTextPropertyProvider >> hyphenationBreaksWithin: anInterval in: anArray [
	"Detect hyphenation break opportunities in the given range.
	Breaks not at cluster boundaries will be ignored."
	| aPrevChar anIterator |
	
	self
		assert: [ self textRun isNotNil ]
		description: [ 'Text run must not be nil' ].
	
	aPrevChar := nil.
	anIterator := self textRun iterator.
	anIterator skipUnits: anInterval first - 1.
	
	anInterval withIndexDo: [ :aTextRunIndex :anArrayIndex |
		| aChar shouldBreak |
		aChar := anIterator nextUnit.
		shouldBreak := aPrevChar = Character space or: [ aPrevChar = $- ].
		aPrevChar := aChar.
		anArray at: anArrayIndex put: shouldBreak ]
]

{ #category : #accessing }
MozTextPropertyProvider >> hyphensOption [
	"Returns the provider's hyphenation setting, so callers can decide
	whether it is necessary to send hyphenationBreaksWithin:
	Hyphens option can be one of NONE, AUTO or MANUAL"
	^ self breakPriority canWrapHyphens
		ifTrue: [ MozTextHyphensOption MANUAL ]
		ifFalse: [ MozTextHyphensOption NONE ]
]

{ #category : #initialization }
MozTextPropertyProvider >> initialize [
	"Do not send super initialize, otherwise handle is reset to 0"

	self initializeCallbacks.

	hyphenWidth := 0.0.
	spacing := 0.0
]

{ #category : #initialization }
MozTextPropertyProvider >> initializeCallbacks [

	self flag: #TODO. "Callbacks do not work on Windows"
	OSPlatform current isWindows
	   ifTrue: [ ^ self ].

	self
		primInitHyphenationBreaks: MozTextPropertyHyphenationBreaksCallback uniqueInstance
		hyphenWidth: MozTextPropertyHyphenWidthCallback uniqueInstance
		spacing: MozTextPropertySpacingCallback uniqueInstance
		drawTarget: MozTextPropertyDrawTargetCallback uniqueInstance
		appUnitsPerDevUnit: MozTextPropertyAppUnitsCallback uniqueInstance
]

{ #category : #'private - ffi' }
MozTextPropertyProvider >> primInitHyphenationBreaks: aHyphenationBreaks hyphenWidth: aHyphenWidth spacing: aSpacing drawTarget: aDrawTarget appUnitsPerDevUnit: anAppUnitsPerDevUnit [

	^ self ffiCall: #(void moz2d_text_run_property_provider_init (
		self,
		MozTextPropertyHyphenationBreaksCallback aHyphenationBreaks,
		MozTextPropertyHyphenWidthCallback aHyphenWidth,
		MozTextPropertySpacingCallback aSpacing,
		MozTextPropertyDrawTargetCallback aDrawTarget,
		MozTextPropertyAppUnitsCallback anAppUnitsPerDevUnit))
]

{ #category : #'private - ffi' }
MozTextPropertyProvider >> primSetDrawTargetCallback: aDrawTargetCallback [

	^ self ffiCall: #(void moz2d_text_run_property_provider_init_draw_target_callback (
		self,
		MozTextPropertyDrawTargetCallback aDrawTargetCallback ) )
]

{ #category : #'private - ffi' }
MozTextPropertyProvider >> primSetHyphensOption: aHyphensOption [

	^ self ffiCall: #(void moz2d_text_run_property_provider_set_hyphens_option (
		self,
		MozTextHyphensOption aHyphensOption ) )
]

{ #category : #accessing }
MozTextPropertyProvider >> spacing [
	^ spacing
]

{ #category : #accessing }
MozTextPropertyProvider >> spacing: aNumber [
	spacing := aNumber
]

{ #category : #accessing }
MozTextPropertyProvider >> spacingWithin: anInterval in: anArray [
	| aSpacing |
	
	aSpacing := self spacing.

	anInterval withIndexDo: [ :aStringIndex :anArrayIndex |
		"Set spacing only after character"
		anArray at: ((anArrayIndex - 1) * 2) + 1 put: 0.
		anArray at: ((anArrayIndex - 1) * 2) + 2 put: aSpacing ]
]

{ #category : #private }
MozTextPropertyProvider >> textRun [
	^ textRun
]

{ #category : #private }
MozTextPropertyProvider >> textRun: aTextRun [
	"Let text property provider know a text run during measurement process.
	Warning! Text run must be set to nil right after measurement to avoid
	memory leaks"

	textRun := aTextRun
]
