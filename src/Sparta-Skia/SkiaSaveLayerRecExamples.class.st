Class {
	#name : #SkiaSaveLayerRecExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : 'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaSaveLayerRecExamples >> default [
	<gtExample>
	| aLayerRec |
	
	aLayerRec := SkiaSaveLayerRec new.
	self assert: aLayerRec isNull not.
	
	^ aLayerRec
]

{ #category : #initialization }
SkiaSaveLayerRecExamples >> setBounds [
	<gtExample>
	| aLayerRec |
	
	aLayerRec := self default.
	self assert: aLayerRec isNull not.

	aLayerRec bounds: (0@0 corner: 100@100).
	
	^ aLayerRec
]

{ #category : #initialization }
SkiaSaveLayerRecExamples >> setPaint [
	<gtExample>
	<noTest>
	| aLayerRec aSkiaPaint |
	
	aLayerRec := self default.
	self assert: aLayerRec isNull not.
	
	aSkiaPaint := SkiaPaint new.
	aLayerRec paint: aSkiaPaint.
	
	"layer rec consumes a paint"
	self assert: aSkiaPaint isNull.
	
	^ aLayerRec
]
