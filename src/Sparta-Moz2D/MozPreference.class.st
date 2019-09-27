Class {
	#name : #MozPreference,
	#superclass : #Object,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#instVars : [
		'value',
		'key'
	],
	#category : 'Sparta-Moz2D-Preferences'
}

{ #category : #accessing }
MozPreference class >> value: anObject [
	^ self new
		value: anObject;
		yourself
]

{ #category : #accessing }
MozPreference >> categories [
	^ self key splitOn: '.'
]

{ #category : #preferences }
MozPreference >> export [
	"transfers me to backend"
	| byteArray |
	byteArray := ((ZnCharacterEncoder newForEncoding: 'utf8')
		encodeString: key, Character null asString).
	self primExport: byteArray value: value
]

{ #category : #accessing }
MozPreference >> key [
	^ key
]

{ #category : #accessing }
MozPreference >> key: anObject [
	key := anObject
]

{ #category : #'private - ffi' }
MozPreference >> primExport: aName value: aValue [

	self subclassResponsibility
]

{ #category : #printing }
MozPreference >> printOn: aStream [

	aStream
		nextPutAll: self value printString;
		yourself
]

{ #category : #accessing }
MozPreference >> value [
	^ value
]

{ #category : #accessing }
MozPreference >> value: anObject [
	value := anObject.
	"commit to backend on change only if key is already set"
	key ifNotNil: [ self export ]
]
