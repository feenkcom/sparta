Class {
	#name : #MozEnum,
	#superclass : #FFIExternalEnumeration,
	#category : 'Sparta-Moz2D-Enums'
}

{ #category : #'test generation' }
MozEnum class >> createEnumMethod [
	(Smalltalk hasClassNamed: self testClassName)
		ifFalse: [ self testClassName asString, ' does not exist!' ].

	(Smalltalk classNamed: self testClassName) compile:
'enum
	"This method was automatically generated"
	^ ', self name asString
	classified: 'accessing'
]

{ #category : #'test generation' }
MozEnum class >> createPrimitiveMethod [
	(Smalltalk hasClassNamed: self testClassName)
		ifFalse: [ self testClassName asString, ' does not exist!' ].

	(Smalltalk classNamed: self testClassName) compile:
'valueNamed: aName in: anAddress
	"This method was automatically generated"
	^ self ffiCall: #(bool moz2d_test_' , self externalEnum asString, '(String aName, int* anAddress))'
	classified: 'private - ffi'
]

{ #category : #'test generation' }
MozEnum class >> createTestClass [

	"Test package is not loaded"
	(Smalltalk hasClassNamed: self testSuperclassName)
		ifFalse: [ ^ self error: self testSuperclassName asString, ' does not exist!' ].

	self testPackageName asPackageIfAbsent: [
		self error: self testPackageName asString, ' is not loaded!' ].

	(Smalltalk hasClassNamed: self testClassName)
		ifTrue: [ self testClassName asString, ' already exists!' ].

	(Smalltalk classNamed: self testSuperclassName) subclass: self testClassName
		instanceVariableNames: ''
		classVariableNames: ''
		package: self testPackageName
]

{ #category : #'test generation' }
MozEnum class >> createTestMethod: anItemName [
	(Smalltalk hasClassNamed: self testClassName)
		ifFalse: [ self testClassName asString, ' does not exist!' ].

	(Smalltalk classNamed: self testClassName) compile:
'test', anItemName asString, '
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum ', anItemName asString ,' item asString) value
		equals: self enum ', anItemName asString, ' value'
	classified: 'tests'
]

{ #category : #'enum declaration' }
MozEnum class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	
	)
]

{ #category : #accessing }
MozEnum class >> externalEnum [
	^ self subclassResponsibility
]

{ #category : #accessing }
MozEnum class >> externalType [
	^ self subclassResponsibility
]

{ #category : #'class initialization' }
MozEnum class >> initialize [
	
	"Skip initialization of root class"
	self = MozEnum
		ifTrue: [ ^ self ].

	self initializeEnumeration.
	representationType := self externalType.
	self initializeTest.
	
	Author
		useAuthor: 'UFFI'
		during: [ self rebuildEnumAccessors ]
]

{ #category : #'class initialization' }
MozEnum class >> initializeTest [

	self wantsTestClass ifTrue: [
		self externalEnum.
		self initializeTestClass.
		self initializeTestMethods ]
]

{ #category : #'class initialization' }
MozEnum class >> initializeTestClass [
	self createTestClass
]

{ #category : #'class initialization' }
MozEnum class >> initializeTestMethods [
	self createEnumMethod.
	self createPrimitiveMethod.
	self enumerationDictionary keysDo: [ :anItemName | self createTestMethod: anItemName ]
]

{ #category : #'test generation' }
MozEnum class >> testClassName [
	^ self name, 'Test'
]

{ #category : #'test generation' }
MozEnum class >> testPackageName [
	^ 'Sparta-Moz2D-Tests'
]

{ #category : #'test generation' }
MozEnum class >> testSuperclassName [
	^ #MozEnumTest
]

{ #category : #'test generation' }
MozEnum class >> wantsTestClass [

	^ 	self ~= MozEnum and: [
			(Smalltalk hasClassNamed: self testSuperclassName) and: [ 
		 		(Smalltalk hasClassNamed: self testClassName) not and: [ 
					(self testPackageName asPackageIfAbsent: [ nil ]) isNotNil ] ] ]
]
