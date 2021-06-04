"
I cache fonts with font style a key
"
Class {
	#name : #SpartaFontCache,
	#superclass : #LRUCache,
	#instVars : [
		'previousAssociation'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #accessing }
SpartaFontCache >> at: key ifAbsentPut: block [
	"If key is present in the cache, return the associated value.
	This is a hit and makes that key/value pair the most recently used.
	If key is absent, use block to compute a new value and cache it.
	Block can optionally take one argument, the key. 
	This is a miss and will create a new key/value pair entry.
	Furthermore this could result in the least recently used key/value pair 
	being removed when the specified maximum cache weight is exceeded."

	self critical: [ | association |
		(previousAssociation isNotNil and: [ previousAssociation key = key ])
			ifTrue: [ ^ previousAssociation value value value ].
		association := keyIndex
			associationAt: key
			ifAbsent: [ | value |
				value := block cull: key.
				"Sadly we have to check the presence of key again 
				in case of the block execution already added the entry"
				keyIndex 
					associationAt: key 
					ifAbsent: [
						association := self newAssociationKey: key value: value.
						previousAssociation := association.
						^ self handleMiss: association ] ].
		previousAssociation := association.
		^ self handleHit: association ]
]

{ #category : #accessing }
SpartaFontCache >> at: key put: value [
	"Populate me by storing value for key. Return value. 
	This is neither a hit nor a miss. Statistics remain unchanged.
	Overwrite if already present without promotion. 
	This could result in the least recently used key/value pair 
	being removed when the specified maximum cache weight is exceeded."
	
	self critical: [ | association link |
		association := keyIndex
			associationAt: key
			ifAbsent: [
				association := self newAssociationKey: key value: value.
				previousAssociation ifNil: [ previousAssociation := association ].
				self addWeight: value.
				link := lruList addLast: association.
				keyIndex at: key put: link.
				^ value ].
		previousAssociation ifNil: [ previousAssociation := association ].
		link := association value.
		weight remove: link value value.
		self addWeight: value.
		link value value: value.
		^ value ]
]

{ #category : #initialization }
SpartaFontCache >> initialize [
	super initialize.
	
	self beThreadSafe
]

{ #category : #removing }
SpartaFontCache >> removeAll [
	"Remove all key/value pairs that I currently hold,
	effectiley resetting me, but not my statistics."
	
	self critical: [
		lruList removeAll.
		keyIndex removeAll.
		weight reset.
		previousAssociation := nil ]
]

{ #category : #removing }
SpartaFontCache >> removeKey: key ifAbsent: block [
	"If I currently cache key, remove the entry.
	Execute block when key is currently absent.
	Return the removed value."
	
	^ self critical: [
		(previousAssociation isNotNil and: [ previousAssociation key = key ])
			ifTrue: [ previousAssociation := nil ].
		(self includesKey: key)
			ifTrue: [ | link value |
				link := keyIndex removeKey: key.
				lruList removeLink: link.
				value := link value value.
				weight remove: value.
				value ]
			ifFalse: block ]
]
