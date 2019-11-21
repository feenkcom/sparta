Class {
	#name : #MozFontFaceBuilder,
	#superclass : #SpartaFontFaceBuilder,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#instVars : [
		'userFontSet'
	],
	#category : #'Sparta-Moz2D-Builders'
}

{ #category : #building }
MozFontFaceBuilder >> build [
	| aFontFace |
	self
		assert: [ familyName isNotNil and: [ familyName isNotEmpty ] ]
		description: [ 'Family name is required' ].

	self
		assert: [ source isNotNil ]
		description: [ 'Source is required' ].

	aFontFace := SpartaUserFontFace new
		familyName: familyName;
		source: source asSpartaFontSource;
		style: style;
		weight: weight;
		stretch: stretch.

	self userFontSet add: aFontFace
]

{ #category : #initialization }
MozFontFaceBuilder >> initialize [
	super initialize.

	userFontSet := MozUserFontSet default
]

{ #category : #accessing }
MozFontFaceBuilder >> userFontSet [
	<return: #MozUserFontSet>

	^ userFontSet
]
