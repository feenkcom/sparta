Class {
	#name : #SkiaParagraphRectWidthStyle,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'Max',
		'Tight'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaParagraphRectWidthStyle class >> Max [
	"This method was automatically generated"
	^ Max
]

{ #category : #'accessing enum' }
SkiaParagraphRectWidthStyle class >> Tight [
	"This method was automatically generated"
	^ Tight
]

{ #category : #'enum declaration' }
SkiaParagraphRectWidthStyle class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Tight,
		Max,
	)
]

{ #category : #accessing }
SkiaParagraphRectWidthStyle class >> externalType [
	^ FFIInt32 new
]

{ #category : #'class initialization' }
SkiaParagraphRectWidthStyle class >> initialize [
	super initialize
]

{ #category : #'private - ffi' }
SkiaParagraphRectWidthStyle >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_clip_op_to_string(self, GtBoxerString aBoxerString))
]
