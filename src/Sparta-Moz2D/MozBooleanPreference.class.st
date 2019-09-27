Class {
	#name : #MozBooleanPreference,
	#superclass : #MozPreference,
	#category : 'Sparta-Moz2D-Preferences'
}

{ #category : #'private - ffi' }
MozBooleanPreference >> primExport: aName value: aValue [

	^ self ffiCall: #(void moz_preferences_set_bool (short* aName, bool aValue))
]
