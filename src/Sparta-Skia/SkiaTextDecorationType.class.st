Class {
	#name : #SkiaTextDecorationType,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'LineThrough',
		'NoDecoration',
		'Overline',
		'Underline'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaTextDecorationType class >> LineThrough [
	"This method was automatically generated"
	^ LineThrough
]

{ #category : #'accessing enum' }
SkiaTextDecorationType class >> NoDecoration [
	"This method was automatically generated"
	^ NoDecoration
]

{ #category : #'accessing enum' }
SkiaTextDecorationType class >> Overline [
	"This method was automatically generated"
	^ Overline
]

{ #category : #'accessing enum' }
SkiaTextDecorationType class >> Underline [
	"This method was automatically generated"
	^ Underline
]

{ #category : #'enum declaration' }
SkiaTextDecorationType class >> enumDecl [
	^ self externalDeclaration
]

{ #category : #'enum declaration' }
SkiaTextDecorationType class >> externalDeclaration [
	^ #(
		NoDecoration 0
		Underline 1
		Overline 2
		LineThrough 4)
]

{ #category : #accessing }
SkiaTextDecorationType class >> externalType [
	^ FFIUInt32 new
]

{ #category : #'class initialization' }
SkiaTextDecorationType class >> initialize [
	super initialize
]
