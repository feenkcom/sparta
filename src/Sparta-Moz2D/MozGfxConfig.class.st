Class {
	#name : #MozGfxConfig,
	#superclass : #Object,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#category : 'Sparta-Moz2D-GFX'
}

{ #category : #'library path' }
MozGfxConfig class >> ffiLibraryName [
	^ MozLibrary
]

{ #category : #accessing }
MozGfxConfig >> features [

	^ Array streamContents: [ :aStream |
		self featuresDo: [ :feature | aStream nextPut: feature ] ]
]

{ #category : #enumerating }
MozGfxConfig >> featuresDo: aBlock [
	| callback |
	callback := FFICallback 
		signature: #(void (char* aNamePtr, char* aDescriptionPtr, void* aFeature))
		block: [ :aNamePtr :aDescriptionPtr :aFeaturePtr |
			[ | aName aDescription aFeature |
			
			aName := String streamContents: [ :aStream | | anIndex aChar |
				anIndex := 1.
				[ (aChar := (aNamePtr signedCharAt: anIndex)) ~= Character null ] whileTrue:
					[ aStream nextPut: aChar. anIndex := anIndex + 1 ] ].

			aDescription := String streamContents: [ :aStream | | anIndex aChar |
				anIndex := 1.
				[ (aChar := (aDescriptionPtr signedCharAt: anIndex)) ~= Character null ] whileTrue:
					[ aStream nextPut: aChar. anIndex := anIndex + 1 ] ].
			
			aFeature := MozGfxFeature fromHandle: aFeaturePtr.
			aFeature name: aName.
			aFeature description: aDescription.
			aBlock value: aFeature ]
			on: Error do: [ :e | 0 "Error happened" ] ].
	self primForEachFeature: callback
]

{ #category : #'library path' }
MozGfxConfig >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #'gt-inspector-extension' }
MozGfxConfig >> gtInspectorFeaturesIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite table
		title: 'Features';
		display: [ self features ];
		when: [ self features size isZero not ];
		column: 'Name' evaluated: [ :each | each name ];
		column: 'Description' evaluated: [ :each | each description ];
		column: 'Enabled' evaluated: [ :each | each isEnabled printString ];
		column: 'Status' evaluated: [ :each | each status item asString ]
]

{ #category : #accessing }
MozGfxConfig >> preferences [
	| rawPreferences aLengthValue aLength aPreferences |
	aLengthValue := ByteArray new: FFIUInt32 externalTypeSize.
	aLengthValue integerAt: 1 put: 0 size: FFIUInt32 externalTypeSize signed: false.
	"We get a reference to array, no need to free"
	rawPreferences := self primAllPreferences: aLengthValue.
	aLength := aLengthValue integerAt: 1 size: FFIUInt32 externalTypeSize signed: false.
	rawPreferences initializeHandle: rawPreferences getHandle getHandle type: (rawPreferences class resolveType: MozGfxPreference) size: aLength.
	"we et reference to MozGfxPreference, no need to free"
	aPreferences := rawPreferences collect: [ :each | (MozGfxPreference fromHandle: each) ] as: Array.
	^ aPreferences
]

{ #category : #'private - ffi' }
MozGfxConfig >> primAllPreferences: aLength [

	^ self ffiCall: #(FFIExternalArray moz_gfx_preferences_all(size_t *aLength ))
]

{ #category : #'private - ffi' }
MozGfxConfig >> primForEachFeature: aCallback [

	^ self ffiCall: #(void moz_gfx_config_for_each_feature(FFICallback aCallback))
]
