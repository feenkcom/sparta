Class {
	#name : #SkiaExternalEnumeration,
	#superclass : #FFIExternalEnumeration,
	#category : #'Sparta-Skia-External'
}

{ #category : #accessing }
SkiaExternalEnumeration class >> definedLayout [
	<return: #Dictionary>

	^ (self variants collect: [ :eachVariant | eachVariant item -> eachVariant value ]) asOrderedDictionary
]

{ #category : #'enum declaration' }
SkiaExternalEnumeration class >> enumDecl [
	| declaration index |
	"
	self rebuildEnumAccessors
	"

	self = SkiaExternalEnumeration
		ifTrue: [ ^ #() ].
		
	index := -1.
	declaration := self externalDeclaration.
	
	self
		assert: [ declaration last = #, ]
		description: [ 'Declaration must end with comma!' ].
	
	^ (declaration pairsCollect: [ :aName :aComma |  index := index + 1. { aName . index } ]) flattened
]

{ #category : #'enum declaration' }
SkiaExternalEnumeration class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ self subclassResponsibility
]

{ #category : #accessing }
SkiaExternalEnumeration class >> externalType [
	^ self subclassResponsibility
]

{ #category : #'library path' }
SkiaExternalEnumeration class >> ffiLibraryName [
	^ SkiaLibrary
]

{ #category : #'as yet unclassified' }
SkiaExternalEnumeration class >> gtDefinedLayoutFor: aView [
	<gtView>
	
	^ (self definedLayout gtItemsFor: aView)
		title: 'Defined layout';
		priority: 2
]

{ #category : #'as yet unclassified' }
SkiaExternalEnumeration class >> gtRealLayoutFor: aView [
	<gtView>
	
	^ (self realLayout gtItemsFor: aView)
		title: 'Real layout';
		priority: 3
]

{ #category : #'class initialization' }
SkiaExternalEnumeration class >> initialize [
	
	"Skip initialization of root class"
	self = SkiaExternalEnumeration
		ifTrue: [ ^ self ].

	self initializeEnumeration.
	representationType := self externalType.
	
	Author
		useAuthor: 'UFFI'
		during: [ self rebuildEnumAccessors ]
]

{ #category : #accessing }
SkiaExternalEnumeration class >> realLayout [
	<return: #Dictionary>

	^ (self variants collect: [ :eachVariant | eachVariant realItem -> eachVariant value ]) asOrderedDictionary
]

{ #category : #private }
SkiaExternalEnumeration class >> rebuildEnumAccessors [

	"Skip initialization of root class"
	self = SkiaExternalEnumeration
		ifTrue: [ ^ self ].

	self initializeEnumeration.
	representationType := self externalType.

	super rebuildEnumAccessors.
]

{ #category : #accessing }
SkiaExternalEnumeration class >> variants [
	<return: #SkiaExternalEnumeration>

	^ self classPool values sorted: [ :a :b | a value < b value ]
]

{ #category : #'library path' }
SkiaExternalEnumeration >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #'private - ffi' }
SkiaExternalEnumeration >> primRealName: aBoxerString [
	"
	^ self ffiCall: #(void skia_image_info_alpha_type_to_string(self, GtBoxerString aBoxerString))
	"

	^ self subclassResponsibility
]

{ #category : #accessing }
SkiaExternalEnumeration >> realItem [
	<return: #Symbol>

	^ (GtBoxerString getStringFrom: [ :aBoxerString | self primRealName: aBoxerString ]) asSymbol
]
