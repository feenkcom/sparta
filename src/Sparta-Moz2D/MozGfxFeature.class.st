Class {
	#name : #MozGfxFeature,
	#superclass : #FFIExternalObject,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#instVars : [
		'name',
		'description'
	],
	#category : 'Sparta-Moz2D-GFX'
}

{ #category : #'library path' }
MozGfxFeature class >> ffiLibraryName [
	^ MozLibrary
]

{ #category : #accessing }
MozGfxFeature >> description [
	^ description
]

{ #category : #accessing }
MozGfxFeature >> description: anObject [
	description := anObject
]

{ #category : #accessing }
MozGfxFeature >> enableByDefault [
	self primEnableByDefault
]

{ #category : #'library path' }
MozGfxFeature >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #testing }
MozGfxFeature >> isEnabled [

	^ self primIsEnabled
]

{ #category : #accessing }
MozGfxFeature >> name [
	^ name
]

{ #category : #accessing }
MozGfxFeature >> name: anObject [
	name := anObject
]

{ #category : #'private - ffi' }
MozGfxFeature >> primEnableByDefault [
	^ self ffiCall: #(void moz_gfx_config_feature_enable_by_default( self ))
]

{ #category : #'private - ffi' }
MozGfxFeature >> primGetStatus [
	^ self ffiCall: #(MozGfxFeatureStatus moz_gfx_config_get_feature_status(self))
]

{ #category : #'private - ffi' }
MozGfxFeature >> primIsEnabled [
	
	^ self ffiCall: #(bool moz_gfx_config_feature_is_enabled( self ) )
]

{ #category : #printing }
MozGfxFeature >> printOn: aStream [

	aStream
		nextPutAll: self name;
		yourself
]

{ #category : #accessing }
MozGfxFeature >> status [
	^ self primGetStatus
]
