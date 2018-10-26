"
I define a basic structure of MozCanvas TestCase and implement a few helper methods
"
Class {
	#name : #MozCanvasTestCase,
	#superclass : #MozTestCase,
	#instVars : [
		'canvas',
		'form'
	],
	#category : #'Sparta-Moz2D-Tests'
}

{ #category : #asserting }
MozCanvasTestCase >> assertPixel: aPoint color: aColor [
	self assert: (self form colorAt: aPoint) equals: aColor
]

{ #category : #asserting }
MozCanvasTestCase >> assertPixels: aRectangle color: aColor [

	self
		assert: (self form copy: aRectangle)
		equals: ((MozTestComparableForm extent: aRectangle extent depth: 32) fillColor: aColor)
]

{ #category : #initialization }
MozCanvasTestCase >> defaultExtent [
	^ 500@500
]

{ #category : #accessing }
MozCanvasTestCase >> form [
	^ form ifNil: [ form := MozTestComparableForm extent: canvas extent depth: 32 fromArray: canvas pixels offset: 0@0 ]
]

{ #category : #running }
MozCanvasTestCase >> setUp [
	super setUp.
	
	canvas := MozCanvas extent: self defaultExtent
]

{ #category : #running }
MozCanvasTestCase >> tearDown [
	super tearDown.

	canvas := nil.
	form := nil
]
