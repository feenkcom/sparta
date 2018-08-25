Class {
	#name : #MozGfxFeatureStatus,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'Available',
		'Blacklisted',
		'Blocked',
		'Broken',
		'CrashedInHandler',
		'CrashedOnStartup',
		'Disabled',
		'Failed',
		'ForceEnabled',
		'Unavailable',
		'Unused'
	],
	#category : 'Sparta-Moz2D-GFX'
}

{ #category : #'accessing enum' }
MozGfxFeatureStatus class >> Available [
	"This method was automatically generated"
	^ Available
]

{ #category : #'accessing enum' }
MozGfxFeatureStatus class >> Blacklisted [
	"This method was automatically generated"
	^ Blacklisted
]

{ #category : #'accessing enum' }
MozGfxFeatureStatus class >> Blocked [
	"This method was automatically generated"
	^ Blocked
]

{ #category : #'accessing enum' }
MozGfxFeatureStatus class >> Broken [
	"This method was automatically generated"
	^ Broken
]

{ #category : #'accessing enum' }
MozGfxFeatureStatus class >> CrashedInHandler [
	"This method was automatically generated"
	^ CrashedInHandler
]

{ #category : #'accessing enum' }
MozGfxFeatureStatus class >> CrashedOnStartup [
	"This method was automatically generated"
	^ CrashedOnStartup
]

{ #category : #'accessing enum' }
MozGfxFeatureStatus class >> Disabled [
	"This method was automatically generated"
	^ Disabled
]

{ #category : #'accessing enum' }
MozGfxFeatureStatus class >> Failed [
	"This method was automatically generated"
	^ Failed
]

{ #category : #'accessing enum' }
MozGfxFeatureStatus class >> ForceEnabled [
	"This method was automatically generated"
	^ ForceEnabled
]

{ #category : #'accessing enum' }
MozGfxFeatureStatus class >> Unavailable [
	"This method was automatically generated"
	^ Unavailable
]

{ #category : #'accessing enum' }
MozGfxFeatureStatus class >> Unused [
	"This method was automatically generated"
	^ Unused
]

{ #category : #'enum declaration' }
MozGfxFeatureStatus class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Unused 0
		Unavailable 1
		CrashedInHandler 2
		Blocked 3
		Blacklisted 4
		Failed 5
		Disabled 6
		Available 7
		ForceEnabled 8
		CrashedOnStartup 9
		Broken 10)
]

{ #category : #'class initialization' }
MozGfxFeatureStatus class >> initialize [
	self initializeEnumeration
]
