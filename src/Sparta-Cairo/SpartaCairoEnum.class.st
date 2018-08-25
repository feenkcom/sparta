Class {
	#name : #SpartaCairoEnum,
	#superclass : #FFIExternalEnumeration,
	#category : 'Sparta-Cairo-Enums'
}

{ #category : #'enum declaration' }
SpartaCairoEnum class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	
	)
]

{ #category : #initialization }
SpartaCairoEnum class >> initialize [

	"Skip initialization of root class"
	self = SpartaCairoEnum
		ifTrue: [ ^ self ].

	self initializeEnumeration.
	Author
		useAuthor: 'UFFI'
		during: [ self rebuildEnumAccessors ]
]
