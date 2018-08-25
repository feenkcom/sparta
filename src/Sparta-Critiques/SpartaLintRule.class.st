"
I am an abstract sparta lint rule. I only check classes and methods from sparta related packages.

I check a provided entity (method, class, package) and answer if provided entity does not pass my constraints.

I automatically get integrated in quality assistant and in Nautilus.

Public API and Key Messages

- packagesToCheck an array of package names that I work with.
- checkEntity: return true if entity does not pass my rule
- shouldCheck: return true if a rule needs to check provided entity

   I am an abstract class, see my leaf subclasses for concrete examples
 
Internal Representation and Key Implementation Points.

	My subclasses must implement checkEntity: and shouldCheck:
"
Class {
	#name : #SpartaLintRule,
	#superclass : #RBBasicLintRule,
	#category : 'Sparta-Critiques'
}

{ #category : #testing }
SpartaLintRule class >> isVisible [
	"Only leaf subclasses are visible Lint rules"
	<return: #Boolean>

	^ self subclasses isEmpty
]

{ #category : #testing }
SpartaLintRule class >> uniqueIdentifierName [
	"This name should be unique and should change only when the rule completely change semantics"
	<return: #String>

	^ self name
]

{ #category : #running }
SpartaLintRule >> basicCheck: anEntity [ 

	(self shouldCheck: anEntity)
		ifFalse: [ ^ false ].
		
	^ self checkEntity: anEntity
]

{ #category : #running }
SpartaLintRule >> checkEntity: anEntity [
	^ self subclassResponsibility
]

{ #category : #accessing }
SpartaLintRule >> packagesToCheck [
	"Return an array of package names that should be checked by sparta lint rules"
	<return: #'Array<String>'>

	^ { 'Sparta-Core'. 'Sparta-Critics'. 'Sparta-Moz2D' }
]

{ #category : #testing }
SpartaLintRule >> shouldCheck: anEntity [
	
	^ self subclassResponsibility
]
