"
enum INPUTS
{
   INPUT = 0,
   SECOND_INPUT
};
"
Class {
	#name : #MozFilterInputs,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'INPUT',
		'SECOND_INPUT'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozFilterInputs class >> INPUT [
	"This method was automatically generated"
	^ INPUT
]

{ #category : #'accessing enum' }
MozFilterInputs class >> SECOND_INPUT [
	"This method was automatically generated"
	^ SECOND_INPUT
]

{ #category : #'enum declaration' }
MozFilterInputs class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		INPUT 0
		SECOND_INPUT 1
	)
]

{ #category : #'class initialization' }
MozFilterInputs class >> initialize [
	self initializeEnumeration
]
