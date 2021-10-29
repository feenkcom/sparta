Class {
	#name : #SkiaParagraphPlaceholderAlignment,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'AboveBaseline',
		'Baseline',
		'BelowBaseline',
		'Bottom',
		'Middle',
		'Top'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaParagraphPlaceholderAlignment class >> AboveBaseline [
	"This method was automatically generated"
	^ AboveBaseline
]

{ #category : #'accessing enum' }
SkiaParagraphPlaceholderAlignment class >> Baseline [
	"This method was automatically generated"
	^ Baseline
]

{ #category : #'accessing enum' }
SkiaParagraphPlaceholderAlignment class >> BelowBaseline [
	"This method was automatically generated"
	^ BelowBaseline
]

{ #category : #'accessing enum' }
SkiaParagraphPlaceholderAlignment class >> Bottom [
	"This method was automatically generated"
	^ Bottom
]

{ #category : #'accessing enum' }
SkiaParagraphPlaceholderAlignment class >> Middle [
	"This method was automatically generated"
	^ Middle
]

{ #category : #'accessing enum' }
SkiaParagraphPlaceholderAlignment class >> Top [
	"This method was automatically generated"
	^ Top
]

{ #category : #'enum declaration' }
SkiaParagraphPlaceholderAlignment class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Baseline,
		AboveBaseline,
		BelowBaseline,
		Top,
		Bottom,
		Middle,
	)
]

{ #category : #accessing }
SkiaParagraphPlaceholderAlignment class >> externalType [
	^ FFIInt32 new
]

{ #category : #'class initialization' }
SkiaParagraphPlaceholderAlignment class >> initialize [
	super initialize
]

{ #category : #'private - ffi' }
SkiaParagraphPlaceholderAlignment >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_placeholder_alignment_to_string(self, GtBoxerString aBoxerString))
]
