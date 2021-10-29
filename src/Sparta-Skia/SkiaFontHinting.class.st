Class {
	#name : #SkiaFontHinting,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'Full',
		'None',
		'Normal',
		'Slight'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaFontHinting class >> Full [
	"This method was automatically generated"
	^ Full
]

{ #category : #'accessing enum' }
SkiaFontHinting class >> None [
	"This method was automatically generated"
	^ None
]

{ #category : #'accessing enum' }
SkiaFontHinting class >> Normal [
	"This method was automatically generated"
	^ Normal
]

{ #category : #'accessing enum' }
SkiaFontHinting class >> Slight [
	"This method was automatically generated"
	^ Slight
]

{ #category : #'enum declaration' }
SkiaFontHinting class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		None,
		Slight,
		Normal,
		Full,
	)
]

{ #category : #accessing }
SkiaFontHinting class >> externalType [
	^ FFIInt32 new
]

{ #category : #'class initialization' }
SkiaFontHinting class >> initialize [
	super initialize
]

{ #category : #'private - ffi' }
SkiaFontHinting >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_font_hinting_to_string(self, GtBoxerString aBoxerString))
]
