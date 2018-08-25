Class {
	#name : #SpartaReturnTypeExistsRule,
	#superclass : #SpartaLintMethodRule,
	#category : 'Sparta-Critiques'
}

{ #category : #running }
SpartaReturnTypeExistsRule >> checkEntity: aMethod [

	^ ((aMethod pragmas select: [ :pragma | pragma keyword beginsWith: #return: ])
		allSatisfy: [ :pragma | pragma arguments allSatisfy: [ :symbol | symbol
				ifNil: [ true ]
				ifNotNil: [ :className | (Smalltalk classOrTraitNamed: className) isNotNil ] ] ]) not
]

{ #category : #accessing }
SpartaReturnTypeExistsRule >> name [
	^ 'Class used in <return: #Class> pragma must exist'
]
