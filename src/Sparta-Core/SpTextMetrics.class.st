Class {
	#name : #SpTextMetrics,
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
SpTextMetrics class >> asExternalTypeOn: generator [
	"use handle ivar to hold my instance"
	^ FFIExternalObjectType objectClass: self
]

{ #category : #'field definition' }
SpTextMetrics class >> fieldsDesc [
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
SpTextMetrics >> advance [
	"Return advance width"
	<return: #Number>

	^ advance
]

{ #category : #accessing }
SpTextMetrics >> ascent [
	^ ascent
]

{ #category : #accessing }
SpTextMetrics >> bounds [

	^ self left @ self top extent: self width @ self height
]

{ #category : #accessing }
SpTextMetrics >> descent [
	^ descent
]

{ #category : #accessing }
SpTextMetrics >> height [
	"Return height of bounding box"
	<return: #Number>

	^ height
]

{ #category : #accessing }
SpTextMetrics >> left [
	"Return x component of the bounding box's origin"
	<return: #Number>

	^ left
]

{ #category : #accessing }
SpTextMetrics >> top [
	"Return y component of the bounding box's origin"
	<return: #Number>

	^ top
]

{ #category : #accessing }
SpTextMetrics >> width [
	"Return width of bounding box"
	<return: #Number>

	^ width
]
