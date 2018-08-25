Class {
	#name : #SpartaLintMethodRule,
	#superclass : #SpartaLintRule,
	#category : 'Sparta-Critiques'
}

{ #category : #testing }
SpartaLintMethodRule class >> checksMethod [
	"I am a method rule and therefore should check methods"
	<return: #Boolean>

	^ true
]

{ #category : #running }
SpartaLintMethodRule >> checkMethod: aMethod [

	(self basicCheck: aMethod)
		ifTrue: [ result addMethod: aMethod ]
]

{ #category : #accessing }
SpartaLintMethodRule >> group [
	^ 'Code Quality'
]

{ #category : #accessing }
SpartaLintMethodRule >> resultClass [
	^ RBSelectorEnvironment
]

{ #category : #testing }
SpartaLintMethodRule >> shouldCheck: aMethod [
	"We check methods only from desired Sparta packages"
	<return: #Boolean>

	^ self packagesToCheck includes: (aMethod package packageName)
]
