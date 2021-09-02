Class {
	#name : 'SkiaPaintStyle',
	#superclass : 'SkiaExternalEnumeration',
	#classVars : [
		'Fill',
		'Stroke',
		'StrokeAndFill'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : 'accessing enum' }
SkiaPaintStyle class >> Fill [
	"This method was automatically generated"
	^ Fill
]

{ #category : 'accessing enum' }
SkiaPaintStyle class >> Stroke [
	"This method was automatically generated"
	^ Stroke
]

{ #category : 'accessing enum' }
SkiaPaintStyle class >> StrokeAndFill [
	"This method was automatically generated"
	^ StrokeAndFill
]

{ #category : 'enum declaration' }
SkiaPaintStyle class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Fill,
		Stroke,
		StrokeAndFill,
	)
]

{ #category : 'accessing' }
SkiaPaintStyle class >> externalType [
	^ FFIUInt8 new
]

{ #category : 'class initialization' }
SkiaPaintStyle class >> initialize [
	super initialize
]

{ #category : 'private - ffi' }
SkiaPaintStyle >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_paint_style_to_string(self, GtBoxerString aBoxerString))
]
