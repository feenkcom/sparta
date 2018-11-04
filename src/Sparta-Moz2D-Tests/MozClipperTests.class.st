Class {
	#name : #MozClipperTests,
	#superclass : #MozTestCase,
	#instVars : [
		'canvas'
	],
	#category : #'Sparta-Moz2D-Tests'
}

{ #category : #accessing }
MozClipperTests >> bounds [
	^ 0@0 extent: self extent
]

{ #category : #accessing }
MozClipperTests >> extent [
	^ 500@500
]

{ #category : #running }
MozClipperTests >> setUp [
	
	canvas := MozCanvas extent: self extent
]

{ #category : #running }
MozClipperTests >> tearDown [

	canvas := nil
]

{ #category : #tests }
MozClipperTests >> testPureClip [
	| clip inside outside partially |
	clip := 100@100 extent: 300@300.
	inside := 150@150 extent: 100@100.
	outside := 0@0 extent: 50@50.
	partially := 50@50 extent: 100@100.

	canvas clip by: clip during: [ 
		self assert: canvas clip localBounds equals: clip.
		self assert: canvas clip globalBounds equals: clip.
		self assert: (canvas clip containsLocal: clip).
		self assert: (canvas clip containsGlobal: clip).
		self assert: (canvas clip containsLocal: inside).
		self assert: (canvas clip containsGlobal: inside).
		self assert: (canvas clip containsLocal: partially).
		self assert: (canvas clip containsGlobal: partially).
		self assert: (canvas clip containsLocal: outside) not.
		self assert: (canvas clip containsGlobal: outside) not ]
]

{ #category : #tests }
MozClipperTests >> testPureSubClip [
	| clip subclip intersect inside outside partially |
	clip := 100@100 extent: 300@300.
	subclip := 250@50 extent: 200@200.
	intersect := clip intersect: subclip.
	
	inside := 300@150 extent: 50@50.
	outside := 150@150 extent: 50@50.
	partially := 300@75 extent: 50@50.

	canvas clip by: clip during: [ 
		canvas clip by: subclip during: [
			self assert: canvas clip localBounds equals: intersect.
			self assert: canvas clip globalBounds equals: intersect.
			self assert: (canvas clip containsLocal: clip).
			self assert: (canvas clip containsGlobal: clip).
			self assert: (canvas clip containsLocal: subclip).
			self assert: (canvas clip containsGlobal: subclip).
			self assert: (canvas clip containsLocal: inside).
			self assert: (canvas clip containsGlobal: inside).
			self assert: (canvas clip containsLocal: partially).
			self assert: (canvas clip containsGlobal: partially).
			self assert: (canvas clip containsLocal: outside) not.
			self assert: (canvas clip containsGlobal: outside) not ] ]
]

{ #category : #tests }
MozClipperTests >> testTransformClip [
	| clip inside outside partially translate |
	translate := 50@50.
	clip := 100@100 extent: 300@300.
	inside := 150@150 extent: 100@100.
	outside := 0@0 extent: 50@50.
	partially := 50@50 extent: 100@100.
	
	canvas transform
		by: [ :t | t translateBy: translate ]
		during: [ canvas clip by: clip during: [ 
			self assert: canvas clip localBounds equals: clip.
			self assert: canvas clip globalBounds equals: (clip translateBy: translate).
			self assert: (canvas clip containsLocal: clip).
			self assert: (canvas clip containsGlobal: (clip translateBy: translate)).
			self assert: (canvas clip containsLocal: inside).
			self assert: (canvas clip containsGlobal: (inside translateBy: translate)).
			self assert: (canvas clip containsLocal: partially).
			self assert: (canvas clip containsGlobal: (partially translateBy: translate)).
			self assert: (canvas clip containsLocal: outside) not.
			self assert: (canvas clip containsGlobal: (outside translateBy: translate)) not ] ]
]
