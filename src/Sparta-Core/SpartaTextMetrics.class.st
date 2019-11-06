Class {
	#name : #SpartaTextMetrics,
	#superclass : #Object,
	#instVars : [
		'ascent',
		'descent',
		'top',
		'left',
		'width',
		'advance',
		'height'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #converting }
SpartaTextMetrics class >> asExternalTypeOn: generator [
	"use handle ivar to hold my instance"
	^ FFIExternalObjectType objectClass: self
]

{ #category : #'field definition' }
SpartaTextMetrics class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
		double advanceWidth;
		double ascent;
		double descent;
		double boundingBoxX;
		double boundingBoxY;
		double boundingBoxWidth;
		double boundingBoxHeight;
	)
]

{ #category : #accessing }
SpartaTextMetrics >> advance [
	"Return advance width"
	<return: #Number>

	^ advance
]

{ #category : #accessing }
SpartaTextMetrics >> ascent [
	^ ascent
]

{ #category : #accessing }
SpartaTextMetrics >> bounds [

	^ self left @ self top extent: self width @ self height
]

{ #category : #accessing }
SpartaTextMetrics >> descent [
	^ descent
]

{ #category : #accessing }
SpartaTextMetrics >> height [
	"Return height of bounding box"
	<return: #Number>

	^ height
]

{ #category : #accessing }
SpartaTextMetrics >> left [
	"Return x component of the bounding box's origin"
	<return: #Number>

	^ left
]

{ #category : #accessing }
SpartaTextMetrics >> top [
	"Return y component of the bounding box's origin"
	<return: #Number>

	^ top
]

{ #category : #accessing }
SpartaTextMetrics >> width [
	"Return width of bounding box"
	<return: #Number>

	^ width
]
