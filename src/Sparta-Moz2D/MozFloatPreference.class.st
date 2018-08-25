Class {
	#name : #MozFloatPreference,
	#superclass : #MozPreference,
	#category : 'Sparta-Moz2D-Preferences'
}

{ #category : #'private - ffi' }
MozFloatPreference >> primExport: aName value: aValue [

	^ self ffiCall: #(void moz_preferences_set_float (short* aName, float aValue))
]
