"
A SpartaWrapperWorldMorph is a special version of a WorldMorph that renders itself on SpartaCanvas
"
Class {
	#name : #SpartaWrapperWorldMorph,
	#superclass : #WorldMorph,
	#category : 'Sparta-Wrapper'
}

{ #category : #patches }
SpartaWrapperWorldMorph class >> beCurrent [
	<script: 'self beCurrent'>

	self installNewWorld
]

{ #category : #patches }
SpartaWrapperWorldMorph class >> restore [
	<script: 'self restore'>

	WorldMorph installNewWorld
]

{ #category : #initialization }
SpartaWrapperWorldMorph >> initialize [
	super initialize.
	worldState := SpartaWrapperWorldState new
]
