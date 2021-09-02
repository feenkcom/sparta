Class {
	#name : 'SkiaPointMode',
	#superclass : 'SkiaExternalEnumeration',
	#classVars : [
		'Lines',
		'Points',
		'Polygon'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : 'accessing enum' }
SkiaPointMode class >> Lines [
	"This method was automatically generated"
	^ Lines
]

{ #category : 'accessing enum' }
SkiaPointMode class >> Points [
	"This method was automatically generated"
	^ Points
]

{ #category : 'accessing enum' }
SkiaPointMode class >> Polygon [
	"This method was automatically generated"
	^ Polygon
]

{ #category : 'enum declaration' }
SkiaPointMode class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Points,
		Lines,
		Polygon,
	)
]

{ #category : 'accessing' }
SkiaPointMode class >> externalType [
	^ FFIInt32 new
]

{ #category : 'class initialization' }
SkiaPointMode class >> initialize [
	super initialize
]

{ #category : 'private - ffi' }
SkiaPointMode >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_point_mode_to_string(self, GtBoxerString aBoxerString))
]
