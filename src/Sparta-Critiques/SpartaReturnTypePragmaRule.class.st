Class {
	#name : #SpartaReturnTypePragmaRule,
	#superclass : #SpartaLintMethodRule,
	#category : 'Sparta-Critiques'
}

{ #category : #testing }
SpartaReturnTypePragmaRule >> anyOverriddenMethodHasReturn: aMethod [
	
	^ (self overriddenMethods: aMethod)
		anySatisfy: [ :each | self hasReturn: each ]
]

{ #category : #testing }
SpartaReturnTypePragmaRule >> anyOverrideMethodHasReturn: aMethod [

	^ (self overrideMethods: aMethod) anySatisfy: [ :each | self hasReturn: each ]
]

{ #category : #private }
SpartaReturnTypePragmaRule >> areAllReturnsInheritanceRelated: anArrayOfRBReturnNodes [
	^ anArrayOfRBReturnNodes
		allSatisfy: [ :return | return value isMessage and: [ self inheritanceMessages includes: return value selector  ] ]
]

{ #category : #running }
SpartaReturnTypePragmaRule >> checkEntity: aMethod [

	^ ((self hasReturn: aMethod)
			or: [ (self anyOverriddenMethodHasReturn: aMethod)
				or: [ self anyOverrideMethodHasReturn: aMethod ] ])
		and: [ (self doesNotHavePragma: aMethod) ]
]

{ #category : #testing }
SpartaReturnTypePragmaRule >> doesNotHavePragma: aMethod [
	^ aMethod pragmas noneSatisfy: [ :pragma | pragma keyword beginsWith: #return: ]
]

{ #category : #testing }
SpartaReturnTypePragmaRule >> hasReturn: aMethod [
	^ (self areAllReturnsInheritanceRelated: (self nonSelfReturns: aMethod)) not
]

{ #category : #accessing }
SpartaReturnTypePragmaRule >> inheritanceMessages [
	^ #(subclassResponsibility explicitRequirement notYetImplemented)
]

{ #category : #accessing }
SpartaReturnTypePragmaRule >> name [
	^ 'Every method with return statement must specify return type with <return: #Class> pragma'
]

{ #category : #private }
SpartaReturnTypePragmaRule >> nonSelfReturns: aMethod [
	^ (aMethod ast allChildren select: [ :each | each isReturn ]) select: [ :node | node value isSelf not ]
]

{ #category : #private }
SpartaReturnTypePragmaRule >> overriddenMethods: aMethod [
	| overridenMethods |
	
	overridenMethods := OrderedCollection new.

	aMethod methodClass allSuperclasses
		do: [ :class |
			class compiledMethodAt: aMethod selector
				ifPresent: [ :method | overridenMethods add: method ]
				ifAbsent: [ ] ].
			
	^ overridenMethods 
]

{ #category : #private }
SpartaReturnTypePragmaRule >> overrideMethods: aMethod [
	| overrideMethods |
	
	overrideMethods := OrderedCollection new.

	aMethod methodClass allSubclasses
		do: [ :class |
			class compiledMethodAt: aMethod selector
				ifPresent: [ :method | overrideMethods add: method ]
				ifAbsent: [ ] ].
			
	^ overrideMethods 
]
