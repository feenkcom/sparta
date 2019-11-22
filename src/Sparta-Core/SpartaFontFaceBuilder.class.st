Class {
	#name : #SpartaFontFaceBuilder,
	#superclass : #SpartaAbstractBuilder,
	#traits : 'TSpFontDescriptor',
	#classTraits : 'TSpFontDescriptor classTrait',
	#instVars : [
		'familyName',
		'source'
	],
	#category : #'Sparta-Core-Builders'
}

{ #category : #building }
SpartaFontFaceBuilder >> build [
	self subclassResponsibility
]

{ #category : #accessing }
SpartaFontFaceBuilder >> familyName [
	^ familyName
]

{ #category : #accessing }
SpartaFontFaceBuilder >> familyName: anObject [
	familyName := anObject
]

{ #category : #initialization }
SpartaFontFaceBuilder >> initialize [
	super initialize.
	
	self styleNormal.
	self weightNormal.
	self stretchNormal
]

{ #category : #'initialize-release' }
SpartaFontFaceBuilder >> reset [
	super reset.
	
	familyName := nil.
	source := nil.
	
	self styleNormal.
	self weightNormal.
	self stretchNormal.
]

{ #category : #accessing }
SpartaFontFaceBuilder >> source [
	^ source
]

{ #category : #accessing }
SpartaFontFaceBuilder >> source: anObject [
	source := anObject
]
