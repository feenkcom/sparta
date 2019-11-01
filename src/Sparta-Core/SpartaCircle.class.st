Class {
	#name : #SpartaCircle,
	#superclass : #SpartaGeometry,
	#instVars : [
		'center',
		'radius'
	],
	#category : #'Sparta-Core-Path'
}

{ #category : #'instance creation' }
SpartaCircle class >> center: aPoint radius: aRadius [
	^ self new
		center: aPoint;
		radius: aRadius
]

{ #category : #accessing }
SpartaCircle >> center [
	<return: #Point>

	^ center
]

{ #category : #accessing }
SpartaCircle >> center: aPoint [
	center := aPoint
]

{ #category : #initialization }
SpartaCircle >> initialize [
	super initialize.
	
	center := 0@0.
	radius := 0
]

{ #category : #accessing }
SpartaCircle >> radius [
	<return: #Number>

	^ radius
]

{ #category : #accessing }
SpartaCircle >> radius: aNumber [
	radius := aNumber
]
