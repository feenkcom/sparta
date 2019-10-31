Class {
	#name : #MozFontBuilder,
	#superclass : #SpartaFontBuilder,
	#traits : 'TMozLibrary + TMozFontDescriptor',
	#classTraits : 'TMozLibrary classTrait + TMozFontDescriptor classTrait',
	#instVars : [
		'fontList'
	],
	#classInstVars : [
		'cache',
		'session'
	],
	#category : 'Sparta-Moz2D-Builders'
}

{ #category : #accessing }
MozFontBuilder class >> cache [

	session == Smalltalk session
		ifFalse: [
			cache := nil.
			session := Smalltalk session ].

	^ cache ifNil: [ cache := self defaultCache ]
]

{ #category : #cleanup }
MozFontBuilder class >> cleanUp [
	super cleanUp.
	
	cache := nil.
	session := nil
]

{ #category : #accessing }
MozFontBuilder class >> defaultCache [
	^ SpartaFontCache new
		maximumWeight: 100 "how many different font we cache";
		yourself
]

{ #category : #comparing }
MozFontBuilder >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].

	^ anotherObject size = size
		and: [ anotherObject weight = weight
			and: [ anotherObject language = language
				and: [ anotherObject stretch = stretch
					and: [ anotherObject style = style
						and: [ anotherObject fontList = fontList ] ] ] ] ]
]

{ #category : #accessing }
MozFontBuilder >> build [

	^ self class cache
		at: self copy "we copy to allow users to continue building fonts"
		ifAbsentPut: [ self createFontGroup ]
]

{ #category : #'private - instance creation' }
MozFontBuilder >> createFontGroup [
		
	^ (MozFontGroup
		from: self createFontList
		userFontSet: self canvas fontFace userFontSet
		style: self createFontStyle)
			autoRelease;
			yourself
]

{ #category : #'private - instance creation' }
MozFontBuilder >> createFontList [
	| aFontList |
	
	fontList ifNil: [
		^ MozFontFamilyList generic: MozFontFamilyType sansSerif ].

	aFontList := MozFontFamilyList empty.
	fontList ifEmpty: [ self sansSerif ].
	fontList do: [ :each | aFontList add: each ].

	^ aFontList
]

{ #category : #'private - instance creation' }
MozFontBuilder >> createFontStyle [

	^ MozFontStyle
		style: style value
		weight: weight value
		stretch: stretch value
		size: size
		language: language
]

{ #category : #'instance creation' }
MozFontBuilder >> cursive [
	self fontListAdd: MozFontFamilyType cursive
]

{ #category : #'instance creation' }
MozFontBuilder >> fantasy [
	self fontListAdd: MozFontFamilyType fantasy
]

{ #category : #'instance creation' }
MozFontBuilder >> fixed [
	self fontListAdd: MozFontFamilyType fixed
]

{ #category : #private }
MozFontBuilder >> fontList [

	^ fontList
]

{ #category : #private }
MozFontBuilder >> fontList: aCollection [

	fontList := aCollection
]

{ #category : #private }
MozFontBuilder >> fontListAdd: aFontName [

	fontList ifNil: [ fontList := OrderedCollection new ].
	fontList add: aFontName
]

{ #category : #comparing }
MozFontBuilder >> hash [
	^ size hash
		bitXor: (weight hash
			bitXor: (language hash
				bitXor: (stretch hash
					bitXor: (style hash
						bitXor: fontList hash))))
]

{ #category : #'instance creation' }
MozFontBuilder >> monospace [
	self fontListAdd: MozFontFamilyType monospace
]

{ #category : #'instance creation' }
MozFontBuilder >> named: aNameString [
	self fontListAdd: aNameString
]

{ #category : #copying }
MozFontBuilder >> postCopy [
	
	"we don't want to copy canvas since it is irrelevant"
	canvas := nil.
	fontList := fontList copy
]

{ #category : #'instance creation' }
MozFontBuilder >> sansSerif [
	self fontListAdd: MozFontFamilyType sansSerif
]

{ #category : #'instance creation' }
MozFontBuilder >> serif [
	self fontListAdd: MozFontFamilyType serif
]

{ #category : #'instance creation' }
MozFontBuilder >> special [
	self fontListAdd: MozFontFamilyType special
]

{ #category : #stretch }
MozFontBuilder >> stretchReset [
	self stretchNormal
]

{ #category : #style }
MozFontBuilder >> styleReset [
	self style: MozTextFontStyle NORMAL value
]

{ #category : #'instance creation' }
MozFontBuilder >> variable [
	self fontListAdd: MozFontFamilyType variable
]

{ #category : #weight }
MozFontBuilder >> weightReset [
	self weightNormal
]
