Class {
	#name : #SkiaSaveLayerRecExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaSaveLayerRecExamples >> default [
	<gtExample>
	<return: #SkiaSaveLayerRec>
	| aLayerRec |
	aLayerRec := SkiaSaveLayerRec new.
	self assert: aLayerRec isNull not.

	^ aLayerRec
]

{ #category : #initialization }
SkiaSaveLayerRecExamples >> setBounds [
	<gtExample>
	<return: #SkiaSaveLayerRec>
	| aLayerRec |
	aLayerRec := self default.
	self assert: aLayerRec isNull not.

	aLayerRec bounds: (0 @ 0 corner: 100 @ 100).

	^ aLayerRec
]

{ #category : #initialization }
SkiaSaveLayerRecExamples >> setPaint [
	<gtExample>
	<return: #SkiaSaveLayerRec>
	| aLayerRec aSkiaPaint |
	aLayerRec := self default.
	self assert: aLayerRec isNull not.

	aSkiaPaint := SkiaPaint new.
	aLayerRec paint: aSkiaPaint.	"layer rec does not consume a paint"
	self assert: aSkiaPaint isNull not.

	^ aLayerRec
]
