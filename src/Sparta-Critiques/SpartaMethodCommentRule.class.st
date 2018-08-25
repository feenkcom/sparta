Class {
	#name : #SpartaMethodCommentRule,
	#superclass : #SpartaLintMethodRule,
	#category : 'Sparta-Critiques'
}

{ #category : #running }
SpartaMethodCommentRule >> checkEntity: aMethod [
	^ aMethod comment isNil
]

{ #category : #running }
SpartaMethodCommentRule >> name [
	^ 'Every method must have a comment!'
]
