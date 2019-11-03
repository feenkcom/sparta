Class {
	#name : #SkiaPathExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaPathExamples >> default [
	<gtExample>
	| aPath |
	
	aPath := SkiaPath new.
	self assert: aPath pointsCount equals: 0.
	self assert: aPath points isEmpty.
	self assert: aPath fillType equals: SkiaPathFillType Winding.
	
	^ aPath
]

{ #category : #accessing }
SkiaPathExamples >> moveTo10_20 [
	<gtExample>
	| aPath |
	
	aPath := self default.
	aPath moveTo: 10@20.
	
	self assert: aPath pointsCount equals: 1.
	self assert: aPath points equals: { 10@20 }.
	
	^ aPath
]

{ #category : #accessing }
SkiaPathExamples >> moveTo10_20_lineTo20_40 [
	<gtExample>
	| aPath |
	
	aPath := self moveTo10_20.
	aPath lineTo: 20@40.
	
	self assert: aPath pointsCount equals: 2.
	self assert: aPath points equals: { 10@20 . 20@40 }.
	
	^ aPath
]
