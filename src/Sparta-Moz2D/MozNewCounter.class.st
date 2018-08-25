Class {
	#name : #MozNewCounter,
	#superclass : #Object,
	#classInstVars : [
		'dictionary',
		'count',
		'link',
		'running'
	],
	#category : 'Sparta-Moz2D'
}

{ #category : #enumerating }
MozNewCounter class >> count: aClass sender: aSender [
	| beforeCount aSendersDictionary aMethod |
	count ifFalse: [ ^ self ].

	[ beforeCount := count.
	count := false.

	aMethod := (((aSender method -> aSender sender method) -> aSender sender sender method) -> (aSender sender sender sender ifNotNil: #method)) -> ((aSender sender sender sender ifNotNil: [ :aContext | aContext sender ifNotNil: #method ])).
	aSendersDictionary := dictionary at: aClass ifAbsentPut: [ 0 -> Dictionary new ].
	aSendersDictionary key: aSendersDictionary key + 1.
	aSendersDictionary value at: aMethod put: (aSendersDictionary value at: aMethod ifAbsent: 0) + 1 ]
		ensure: [ count := beforeCount ]
]

{ #category : #layer }
MozNewCounter class >> during: aBlock [
	[ dictionary := Dictionary new.
	link := MetaLink new
		metaObject: [ :aClass :aContext | MozNewCounter count: aClass sender: aContext sender sender ];
		selector: #value:value:;
		arguments: #(#class context).
	(Behavior >> #basicNew) ast link: link.
	count := true.
	aBlock value ]
		ensure: [
			count := false.
			(Behavior >> #basicNew) ast removeLink: link.
			self sort ].
	^ dictionary
]

{ #category : #layer }
MozNewCounter class >> duringOnce: aBlock [
	| aResult |
	running ifTrue: [ ^ aBlock value ].
	running := true.
	self during: [ aResult := aBlock value ].
	^ aResult
]

{ #category : #initialization }
MozNewCounter class >> initialize [
	super initialize.
	
	count := false.
	running := false
]

{ #category : #mapping }
MozNewCounter class >> map [
	^ dictionary
]

{ #category : #accessing }
MozNewCounter class >> reset [
	running := false.
	dictionary := Dictionary new.
]

{ #category : #mapping }
MozNewCounter class >> sort [
	dictionary := dictionary associations sort: [ :a :b | a value > b value ].
	dictionary do: [ :anAssociation |
		| theSortedAssociations |
		theSortedAssociations := anAssociation value value associations sort: [ :a :b | a value > b value ].
		anAssociation value value: theSortedAssociations asOrderedDictionary ].
	dictionary := dictionary asOrderedDictionary
]
