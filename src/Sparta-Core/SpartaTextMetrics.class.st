Class {
	#name : #SpartaTextMetrics,
	#superclass : #Object,
	#instVars : [
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
SpartaTextMetrics >> advance: aNumber [
	advance := aNumber
]

{ #category : #accessing }
SpartaTextMetrics >> ascent [
	self deprecated: 'Use font metrics instead!'
]

{ #category : #accessing }
SpartaTextMetrics >> bounds [

	^ self left @ self top extent: self width @ self height
]

{ #category : #accessing }
SpartaTextMetrics >> descent [
	self deprecated: 'Use font metrics instead!'
]

{ #category : #accessing }
SpartaTextMetrics >> height [
	"Return height of bounding box"
	<return: #Number>

	^ height
]

{ #category : #accessing }
SpartaTextMetrics >> height: anObject [
	height := anObject
]

{ #category : #accessing }
SpartaTextMetrics >> left [
	"Return x component of the bounding box's origin"
	<return: #Number>

	^ left
]

{ #category : #accessing }
SpartaTextMetrics >> left: anObject [
	left := anObject
]

{ #category : #accessing }
SpartaTextMetrics >> top [
	"Return y component of the bounding box's origin"
	<return: #Number>

	^ top
]

{ #category : #accessing }
SpartaTextMetrics >> top: anObject [
	top := anObject
]

{ #category : #accessing }
SpartaTextMetrics >> width [
	"Return width of bounding box"
	<return: #Number>

	^ width
]

{ #category : #accessing }
SpartaTextMetrics >> width: anObject [
	width := anObject
]
