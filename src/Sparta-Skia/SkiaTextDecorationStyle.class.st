Class {
	#name : #SkiaTextDecorationStyle,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'Dashed',
		'Dotted',
		'Double',
		'Solid',
		'Wavy'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaTextDecorationStyle class >> Dashed [
	"This method was automatically generated"
	^ Dashed
]

{ #category : #'accessing enum' }
SkiaTextDecorationStyle class >> Dotted [
	"This method was automatically generated"
	^ Dotted
]

{ #category : #'accessing enum' }
SkiaTextDecorationStyle class >> Double [
	"This method was automatically generated"
	^ Double
]

{ #category : #'accessing enum' }
SkiaTextDecorationStyle class >> Solid [
	"This method was automatically generated"
	^ Solid
]

{ #category : #'accessing enum' }
SkiaTextDecorationStyle class >> Wavy [
	"This method was automatically generated"
	^ Wavy
]

{ #category : #'enum declaration' }
SkiaTextDecorationStyle class >> externalDeclaration [
	^ #(
		Solid,
		Double,
		Dotted,
		Dashed,
		Wavy,)
]

{ #category : #accessing }
SkiaTextDecorationStyle class >> externalType [
	^ FFIUInt32 new
]

{ #category : #'class initialization' }
SkiaTextDecorationStyle class >> initialize [
	super initialize
]
