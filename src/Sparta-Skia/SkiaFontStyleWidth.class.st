Class {
	#name : #SkiaFontStyleWidth,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'Condensed',
		'Expanded',
		'ExtraCondensed',
		'ExtraExpanded',
		'Normal',
		'SemiCondensed',
		'SemiExpanded',
		'UltraCondensed',
		'UltraExpanded'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaFontStyleWidth class >> Condensed [
	"This method was automatically generated"
	^ Condensed
]

{ #category : #'accessing enum' }
SkiaFontStyleWidth class >> Expanded [
	"This method was automatically generated"
	^ Expanded
]

{ #category : #'accessing enum' }
SkiaFontStyleWidth class >> ExtraCondensed [
	"This method was automatically generated"
	^ ExtraCondensed
]

{ #category : #'accessing enum' }
SkiaFontStyleWidth class >> ExtraExpanded [
	"This method was automatically generated"
	^ ExtraExpanded
]

{ #category : #'accessing enum' }
SkiaFontStyleWidth class >> Normal [
	"This method was automatically generated"
	^ Normal
]

{ #category : #'accessing enum' }
SkiaFontStyleWidth class >> SemiCondensed [
	"This method was automatically generated"
	^ SemiCondensed
]

{ #category : #'accessing enum' }
SkiaFontStyleWidth class >> SemiExpanded [
	"This method was automatically generated"
	^ SemiExpanded
]

{ #category : #'accessing enum' }
SkiaFontStyleWidth class >> UltraCondensed [
	"This method was automatically generated"
	^ UltraCondensed
]

{ #category : #'accessing enum' }
SkiaFontStyleWidth class >> UltraExpanded [
	"This method was automatically generated"
	^ UltraExpanded
]

{ #category : #'enum declaration' }
SkiaFontStyleWidth class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		UltraCondensed,
		ExtraCondensed,
		Condensed,
		SemiCondensed,
		Normal,
		SemiExpanded,
		Expanded,
		ExtraExpanded,
		UltraExpanded,
	)
]

{ #category : #accessing }
SkiaFontStyleWidth class >> externalType [
	^ FFIInt32 new
]

{ #category : #'class initialization' }
SkiaFontStyleWidth class >> initialize [
	super initialize
]

{ #category : #converting }
SkiaFontStyleWidth >> asSpartaFontStretch [
	^ SpartaFontStretch normal
]

{ #category : #'private - ffi' }
SkiaFontStyleWidth >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_font_style_width_to_string(self, GtBoxerString aBoxerString))
]
