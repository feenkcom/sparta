Class {
	#name : #MozIntegerPreference,
	#superclass : #MozPreference,
	#category : 'Sparta-Moz2D-Preferences'
}

{ #category : #'private - ffi' }
MozIntegerPreference >> primExport: aName value: aValue [

	^ self ffiCall: #(void moz_preferences_set_int (short* aName, int32 aValue))
]
