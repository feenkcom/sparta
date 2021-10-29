Class {
	#name : #SkiaFilterQuality,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'High',
		'Low',
		'Medium',
		'None'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaFilterQuality class >> High [
	"This method was automatically generated"
	^ High
]

{ #category : #'accessing enum' }
SkiaFilterQuality class >> Low [
	"This method was automatically generated"
	^ Low
]

{ #category : #'accessing enum' }
SkiaFilterQuality class >> Medium [
	"This method was automatically generated"
	^ Medium
]

{ #category : #'accessing enum' }
SkiaFilterQuality class >> None [
	"This method was automatically generated"
	^ None
]

{ #category : #'enum declaration' }
SkiaFilterQuality class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		None,
		Low,
		Medium,
		High,
	)
]

{ #category : #accessing }
SkiaFilterQuality class >> externalType [
	^ FFIInt32 new
]

{ #category : #'class initialization' }
SkiaFilterQuality class >> initialize [
	super initialize
]

{ #category : #'private - ffi' }
SkiaFilterQuality >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_filter_quality_to_string(self, GtBoxerString aBoxerString))
]
