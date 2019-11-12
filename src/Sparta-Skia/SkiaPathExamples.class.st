Class {
	#name : #SkiaPathExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #'examples - arc to' }
SkiaPathExamples >> arcTo_0 [
	<gtExample>
	| aPath |
	
	aPath := self default.
	aPath arcTo: (0@0 extent: 50@50) start: 0 sweep: 0 forceMove: false.
	
	self assert: aPath pointsCount equals: 1.
	self assert: aPath points equals: {(50.0@25.0)}.
	
	^ aPath
]

{ #category : #'examples - arc to' }
SkiaPathExamples >> arcTo_180 [
	<gtExample>
	| aPath |
	
	aPath := self default.
	aPath arcTo: (0@0 extent: 50@50) start: 0 sweep: 180 forceMove: false.
	
	self assert: aPath pointsCount equals: 5.
	self assert: aPath points equals: {(50.0@25.0). (50.0@50.0). (25.0@50.0). (0.0@50.0). (0.0@25.0)}.
	
	^ aPath
]

{ #category : #'examples - arc to' }
SkiaPathExamples >> arcTo_270 [
	<gtExample>
	| aPath |
	
	aPath := self default.
	aPath arcTo: (0@0 extent: 50@50) start: 0 sweep: 270 forceMove: false.
	
	self assert: aPath pointsCount equals: 7.
	self assert: aPath points equals: {(50.0@25.0). (50.0@50.0). (25.0@50.0). (0.0@50.0). (0.0@25.0). (0.0@0.0). (25.0@0.0)}.
	
	^ aPath
]

{ #category : #'examples - arc to' }
SkiaPathExamples >> arcTo_359_99 [
	<gtExample>
	| aPath |
	
	aPath := self default.
	aPath arcTo: (0@0 extent: 50@50) start: 0 sweep: 359.99 forceMove: false.
	
	self assert: aPath pointsCount equals: 9.
	
	^ aPath
]

{ #category : #'examples - arc to' }
SkiaPathExamples >> arcTo_360 [
	<gtExample>
	| aPath |
	
	aPath := self default.
	aPath arcTo: (0@0 extent: 50@50) start: 0 sweep: 360 forceMove: false.
	
	self assert: aPath pointsCount equals: 1.
	self assert: (aPath points first closeTo: (50.0@25.0)).
	
	^ aPath
]

{ #category : #'examples - arc to' }
SkiaPathExamples >> arcTo_360_0 [
	<gtExample>
	| aPath |
	
	aPath := self default.
	aPath arcTo: (0@0 extent: 50@50) start: 0 sweep: 360.02 forceMove: false.
	
	"self assert: aPath pointsCount equals: 9."
	
	^ aPath
]

{ #category : #'examples - arc to' }
SkiaPathExamples >> arcTo_360_01 [
	<gtExample>
	| aPath |
	
	aPath := self default.
	aPath arcTo: (0@0 extent: 50@50) start: 0 sweep: 360.01 forceMove: false.
	
	self assert: aPath pointsCount equals: 1.
	
	^ aPath
]

{ #category : #'examples - arc to' }
SkiaPathExamples >> arcTo_360_025 [
	<gtExample>
	| aPath |
	
	aPath := self default.
	aPath arcTo: (0@0 extent: 50@50) start: 0 sweep: 360.025 forceMove: false.
	
	self assert: aPath pointsCount equals: 3.
	
	^ aPath
]

{ #category : #'examples - arc to' }
SkiaPathExamples >> arcTo_450 [
	<gtExample>
	| aPath |
	
	aPath := self default.
	aPath arcTo: (0@0 extent: 50@50) start: 0 sweep: 450 forceMove: false.
	
	self assert: aPath pointsCount equals: 3.
	self assert: aPath points equals: {(50.0@25.0). (50.0@50.0). (25.0@50.0)}.
	
	^ aPath
]

{ #category : #'examples - arc to' }
SkiaPathExamples >> arcTo_90 [
	<gtExample>
	| aPath |
	
	aPath := self default.
	aPath arcTo: (0@0 extent: 50@50) start: 0 sweep: 90 forceMove: false.
	
	self assert: aPath pointsCount equals: 3.
	self assert: aPath points equals: {(50.0@25.0). (50.0@50.0). (25.0@50.0) }.
	
	^ aPath
]

{ #category : #'examples - arc to' }
SkiaPathExamples >> arcTo_minus_90 [
	<gtExample>
	| aPath |
	
	aPath := self default.
	aPath arcTo: (0@0 extent: 50@50) start: 0 sweep: -90 forceMove: false.
	
	self assert: aPath pointsCount equals: 3.
	self assert: aPath points equals: {(50.0@25.0). (50.0@0.0). (25.0@0.0)}.
	
	^ aPath
]

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
