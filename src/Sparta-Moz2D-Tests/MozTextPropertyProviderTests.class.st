Class {
	#name : #MozTextPropertyProviderTests,
	#superclass : #MozTestCase,
	#instVars : [
		'propertyProvider'
	],
	#category : #'Sparta-Moz2D-Tests'
}

{ #category : #'private - ffi' }
MozTextPropertyProviderTests >> primGetAppUnits: aPropertyProvider [

	^ self ffiCall: #(uint32 moz2d_text_run_property_provider_get_app_units (MozTextPropertyProvider aPropertyProvider))
]

{ #category : #'private - ffi' }
MozTextPropertyProviderTests >> primGetBreaks: aPropertyProvider start: aStart end: anEnd array: anArray [ 

	^ self ffiCall: #(void moz2d_text_run_property_provider_get_breaks (
		MozTextPropertyProvider aPropertyProvider,
		uint32 aStart,
		uint32 anEnd,
		void* anArray ))
]

{ #category : #'private - ffi' }
MozTextPropertyProviderTests >> primGetDrawTarget: aPropertyProvider [

	^ self ffiCall: #(void* moz2d_text_run_property_provider_get_draw_target (MozTextPropertyProvider aPropertyProvider))
]

{ #category : #'private - ffi' }
MozTextPropertyProviderTests >> primGetHyphenOption: aPropertyProvider [

	^ self ffiCall: #(int8 moz2d_text_run_property_provider_get_hyphens_option (MozTextPropertyProvider aPropertyProvider))
]

{ #category : #'private - ffi' }
MozTextPropertyProviderTests >> primGetHyphenWidth: aPropertyProvider [

	^ self ffiCall: #(double moz2d_text_run_property_provider_get_hyphen_width (MozTextPropertyProvider aPropertyProvider))
]

{ #category : #'private - ffi' }
MozTextPropertyProviderTests >> primGetSmalltalkPtr: aPropertyProvider [

	^ self ffiCall: #(ulong moz2d_text_run_property_provider_get_smalltalk_ptr (MozTextPropertyProvider aPropertyProvider))
]

{ #category : #'private - ffi' }
MozTextPropertyProviderTests >> primGetSpacing: aPropertyProvider start: aStart end: anEnd array: anArray [ 

	^ self ffiCall: #(void moz2d_text_run_property_provider_get_spacing (
		MozTextPropertyProvider aPropertyProvider,
		uint32 aStart,
		uint32 anEnd,
		double* anArray))
]

{ #category : #'private - ffi' }
MozTextPropertyProviderTests >> primIsValid: aPropertyProvider [

	^ self ffiCall: #(bool moz2d_text_run_property_provider_is_valid (MozTextPropertyProvider aPropertyProvider))
]

{ #category : #running }
MozTextPropertyProviderTests >> setUp [

	propertyProvider := MozTextPropertyProvider new.
	propertyProvider hyphenWidth: 10.
	propertyProvider autoRelease
]

{ #category : #running }
MozTextPropertyProviderTests >> tearDown [
	propertyProvider := nil
]

{ #category : #tests }
MozTextPropertyProviderTests >> testGetAppUnits [
	"bug in Alien callbacks.
	@see MozFFITest>>testCallbackUIntptr"

	| actualAppUnits |
	
	actualAppUnits := self primGetAppUnits: propertyProvider.

	self assert: actualAppUnits equals: propertyProvider appUnitsPerDevUnit
]

{ #category : #tests }
MozTextPropertyProviderTests >> testGetBreaks [
	<expectedFailure>
	"bug in FFI:
	
	array := FFIExternalArray externalNewType: 'bool' size: 1.
	array autoRelease.
	array at: 1 put: true.
	Object assert: (array at: 1)"
	
	
	| aString aStart anEnd anExpected anActual anExternalArray |
	
	aString := 'Hel-lo world!'.
	aStart := 0.
	anEnd := aString size.

	anExpected := Array new: (anEnd - aStart) withAll: false.
	anExpected at: 5 put: true.
	anExpected at: 7 put: true.

	propertyProvider breakPriority: MozTextBreakPriority eNormalBreak.
	propertyProvider textRun: (MozTextRun fromString: aString).

	anExternalArray := FFIExternalArray externalNewType: 'bool' size: (anEnd - aStart).
	anExternalArray atAllPut: false.

	self primGetBreaks: propertyProvider start: aStart end: anEnd array: anExternalArray getHandle.
	
	anActual := anExternalArray asArray.
	anExternalArray free.
	
	self assert: anActual equals: anExpected
]

{ #category : #tests }
MozTextPropertyProviderTests >> testGetDrawTarget [
	"bug in Alien callbacks.
	@see MozFFITest>>testCallbackUIntptr"
	
	| canvas actualCanvas |
	
	canvas := MozCanvas extent: 200@200.
	propertyProvider canvas: canvas.
	actualCanvas := self primGetDrawTarget: propertyProvider.

	self assert: actualCanvas getHandle value equals: canvas getHandle value
]

{ #category : #tests }
MozTextPropertyProviderTests >> testGetHyphenWidth [
	"bug in Alien callbacks.
	@see MozFFITest>>testCallbackUIntptr"
	
	| actualWidth |

	actualWidth := self primGetHyphenWidth: propertyProvider.
	self assert: (actualWidth - propertyProvider hyphenWidth) abs < 0.000001
]

{ #category : #tests }
MozTextPropertyProviderTests >> testGetSpacing [
	"bug in Alien callbacks.
	@see MozFFITest>>testCallbackUIntptr"
	
	| aSpacing aStart anEnd anExpected anActual anExternalArray |
	aSpacing := 20.0.
	aStart := 10.
	anEnd := 20. "without last, open interval"
	anExpected := Array new: (anEnd - aStart) * 2 withAll: 0.
	anExpected withIndexDo: [ :each :index |
		index % 2 = 0
			ifTrue: [ anExpected at: index put: aSpacing ] ].
	
	propertyProvider spacing: aSpacing.
	
	anExternalArray := FFIExternalArray externalNewType: 'double' size: (anEnd - aStart) * 2.
	anExternalArray atAllPut: 0.
	
	self primGetSpacing: propertyProvider start: aStart end: anEnd array: anExternalArray getHandle.
	
	anActual := anExternalArray asArray.
	anExternalArray free.
	
	self assert: anActual equals: anExpected
]

{ #category : #tests }
MozTextPropertyProviderTests >> testIdentityHash [
	| actualHash |

	actualHash := self primGetSmalltalkPtr: propertyProvider.
	self assert: actualHash equals: propertyProvider identityHash
]

{ #category : #tests }
MozTextPropertyProviderTests >> testIsValid [

	self assert: (self primIsValid: propertyProvider)
]
