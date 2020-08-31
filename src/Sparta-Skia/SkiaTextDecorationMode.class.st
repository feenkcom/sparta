Class {
	#name : #SkiaTextDecorationMode,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'Gaps',
		'Through'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaTextDecorationMode class >> Gaps [
	"This method was automatically generated"
	^ Gaps
]

{ #category : #'accessing enum' }
SkiaTextDecorationMode class >> Through [
	"This method was automatically generated"
	^ Through
]

{ #category : #'enum declaration' }
SkiaTextDecorationMode class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Gaps,
		Through,
	)
]

{ #category : #accessing }
SkiaTextDecorationMode class >> externalType [
	^ FFIUInt32 new
]

{ #category : #'class initialization' }
SkiaTextDecorationMode class >> initialize [
	super initialize
]
