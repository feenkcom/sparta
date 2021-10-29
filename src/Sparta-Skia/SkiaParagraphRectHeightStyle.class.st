Class {
	#name : #SkiaParagraphRectHeightStyle,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'IncludeLineSpacingBottom',
		'IncludeLineSpacingMiddle',
		'IncludeLineSpacingTop',
		'Max',
		'Strut',
		'Tight'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaParagraphRectHeightStyle class >> IncludeLineSpacingBottom [
	"This method was automatically generated"
	^ IncludeLineSpacingBottom
]

{ #category : #'accessing enum' }
SkiaParagraphRectHeightStyle class >> IncludeLineSpacingMiddle [
	"This method was automatically generated"
	^ IncludeLineSpacingMiddle
]

{ #category : #'accessing enum' }
SkiaParagraphRectHeightStyle class >> IncludeLineSpacingTop [
	"This method was automatically generated"
	^ IncludeLineSpacingTop
]

{ #category : #'accessing enum' }
SkiaParagraphRectHeightStyle class >> Max [
	"This method was automatically generated"
	^ Max
]

{ #category : #'accessing enum' }
SkiaParagraphRectHeightStyle class >> Strut [
	"This method was automatically generated"
	^ Strut
]

{ #category : #'accessing enum' }
SkiaParagraphRectHeightStyle class >> Tight [
	"This method was automatically generated"
	^ Tight
]

{ #category : #'enum declaration' }
SkiaParagraphRectHeightStyle class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Tight,
		Max,
		IncludeLineSpacingMiddle,
		IncludeLineSpacingTop,
		IncludeLineSpacingBottom,
		Strut,
	)
]

{ #category : #accessing }
SkiaParagraphRectHeightStyle class >> externalType [
	^ FFIInt32 new
]

{ #category : #'class initialization' }
SkiaParagraphRectHeightStyle class >> initialize [
	super initialize
]

{ #category : #'private - ffi' }
SkiaParagraphRectHeightStyle >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_clip_op_to_string(self, GtBoxerString aBoxerString))
]
