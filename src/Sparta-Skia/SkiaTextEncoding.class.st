Class {
	#name : #SkiaTextEncoding,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'GlyphId',
		'UTF16',
		'UTF32',
		'UTF8'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaTextEncoding class >> GlyphId [
	"This method was automatically generated"
	^ GlyphId
]

{ #category : #'accessing enum' }
SkiaTextEncoding class >> UTF16 [
	"This method was automatically generated"
	^ UTF16
]

{ #category : #'accessing enum' }
SkiaTextEncoding class >> UTF32 [
	"This method was automatically generated"
	^ UTF32
]

{ #category : #'accessing enum' }
SkiaTextEncoding class >> UTF8 [
	"This method was automatically generated"
	^ UTF8
]

{ #category : #'enum declaration' }
SkiaTextEncoding class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		UTF8,
		UTF16,
		UTF32,
		GlyphId,
	)
]

{ #category : #accessing }
SkiaTextEncoding class >> externalType [
	^ FFIInt32 new
]

{ #category : #'class initialization' }
SkiaTextEncoding class >> initialize [
	super initialize
]

{ #category : #'private - ffi' }
SkiaTextEncoding >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_text_encoding_to_string(self, GtBoxerString aBoxerString))
]
