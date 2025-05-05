Class {
	#name : #SkiaArrayColorExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaArrayColorExamples >> default [
	<gtExample>
	<return: #SkiaArrayColor>
	| anArray |
	anArray := SkiaArrayColor new.

	self assert: anArray capacity isZero.
	self assert: anArray size isZero.

	^ anArray
]

{ #category : #accessing }
SkiaArrayColorExamples >> setColor [
	<gtExample>
	<return: #SkiaArrayColor>
	| theColors |
	theColors := SkiaArrayColor new: 2 withAll: (SkiaColor fromColor: Color red).
	theColors at: 1 put: Color blue.

	self assert: theColors capacity equals: 2.
	self assert: theColors size equals: 2.
	self
		assert: theColors asArray
		equals: {Color blue.
				Color red}.

	theColors at: 2 put: Color green.

	self assert: theColors capacity equals: 2.
	self assert: theColors size equals: 2.
	self
		assert: theColors asArray
		equals: {Color blue.
				Color green}.

	^ theColors
]

{ #category : #accessing }
SkiaArrayColorExamples >> withColors [
	<gtExample>
	<return: #SkiaArrayColor>
	| theColors |
	theColors := SkiaArrayColor new: 2 withAll: (SkiaColor fromColor: Color red).

	self assert: theColors capacity equals: 2.
	self assert: theColors size equals: 2.

	self
		assert: theColors asArray
		equals: {Color red.
				Color red}.

	^ theColors
]
