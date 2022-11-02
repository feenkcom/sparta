Class {
	#name : #SkiaBatcher,
	#superclass : #SpartaBatcher,
	#instVars : [
		'textRunBatch'
	],
	#category : #'Sparta-Skia-Builders'
}

{ #category : #initialization }
SkiaBatcher >> initialize [
	super initialize.
	
	textRunBatch := OrderedCollection new
]

{ #category : #accessing }
SkiaBatcher >> process [
]
