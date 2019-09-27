Class {
	#name : #MozGfxPreference,
	#superclass : #FFIExternalObject,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#category : 'Sparta-Moz2D-GFX'
}

{ #category : #accessing }
MozGfxPreference >> name [

	^ self primGetName
]

{ #category : #'private - ffi' }
MozGfxPreference >> primGetName [
	^ self ffiCall: #(String moz_gfx_preference_get_name (self))
]

{ #category : #printing }
MozGfxPreference >> printOn: aStream [

	aStream
		nextPutAll: self name;
		yourself
]
