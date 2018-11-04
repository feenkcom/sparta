"
I represent a user font face.
My properties are backend specific
"
Class {
	#name : #SpUserFontFace,
	#superclass : #Object,
	#instVars : [
		'familyName',
		'style',
		'weight',
		'stretch',
		'unicodeRange',
		'source'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #comparing }
SpUserFontFace >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].
	^ anotherObject familyName = self familyName
		and: [ anotherObject source = self source
			and: [ anotherObject stretch value = self stretch value
				and: [ anotherObject style value = self style value
					and: [ anotherObject unicodeRange = self unicodeRange
						and: [ anotherObject weight value = self weight value ] ] ] ] ]
]

{ #category : #accessing }
SpUserFontFace >> familyName [
	^ familyName
]

{ #category : #accessing }
SpUserFontFace >> familyName: anObject [
	familyName := anObject
]

{ #category : #comparing }
SpUserFontFace >> hash [
	^ self familyName hash
		bitXor: (self source hash
			bitXor: (self stretch value hash
				bitXor: (self style value hash
					bitXor: (self unicodeRange hash
						bitXor: self weight value hash))))
]

{ #category : #accessing }
SpUserFontFace >> source [
	^ source
]

{ #category : #accessing }
SpUserFontFace >> source: anObject [
	source := anObject
]

{ #category : #accessing }
SpUserFontFace >> stretch [
	^ stretch
]

{ #category : #accessing }
SpUserFontFace >> stretch: anObject [
	stretch := anObject
]

{ #category : #accessing }
SpUserFontFace >> style [
	^ style
]

{ #category : #accessing }
SpUserFontFace >> style: anObject [
	style := anObject
]

{ #category : #accessing }
SpUserFontFace >> unicodeRange [
	^ unicodeRange
]

{ #category : #accessing }
SpUserFontFace >> unicodeRange: anObject [
	unicodeRange := anObject
]

{ #category : #accessing }
SpUserFontFace >> weight [
	^ weight
]

{ #category : #accessing }
SpUserFontFace >> weight: anObject [
	weight := anObject
]
