Class {
	#name : #SkiaColorExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaColorExamples >> default [
	<gtExample>
	| aColor |
	
	aColor := SkiaColor new.
	self assert: aColor red equals: 0.
	self assert: aColor green equals: 0.
	self assert: aColor blue equals: 0.
	self assert: aColor alpha equals: 0.
	
	^ aColor
]

{ #category : #accessing }
SkiaColorExamples >> fromColorBlack [
	<gtExample>
	| aColor aSkiaColor |
	
	aColor := Color black alpha: 0.5.
	aSkiaColor := SkiaColor fromColor: aColor.
	self assert: aSkiaColor red equals: 0.
	self assert: aSkiaColor green equals: 0.
	self assert: aSkiaColor blue equals: 0.
	self assert: aSkiaColor alpha equals: 127.
	
	^ aColor
]

{ #category : #accessing }
SkiaColorExamples >> fromColorBlue [
	<gtExample>
	| aColor aSkiaColor |
	
	aColor := Color blue alpha: 0.5.
	aSkiaColor := SkiaColor fromColor: aColor.
	self assert: aSkiaColor red equals: 0.
	self assert: aSkiaColor green equals: 0.
	self assert: aSkiaColor blue equals: 255.
	self assert: aSkiaColor alpha equals: 127.
	
	^ aColor
]

{ #category : #accessing }
SkiaColorExamples >> fromColorGreen [
	<gtExample>
	| aColor aSkiaColor |
	
	aColor := Color green alpha: 0.5.
	aSkiaColor := SkiaColor fromColor: aColor.
	self assert: aSkiaColor red equals: 0.
	self assert: aSkiaColor green equals: 255.
	self assert: aSkiaColor blue equals: 0.
	self assert: aSkiaColor alpha equals: 127.
	
	^ aColor
]

{ #category : #accessing }
SkiaColorExamples >> fromColorRed [
	<gtExample>
	| aColor aSkiaColor |
	
	aColor := Color red alpha: 0.5.
	aSkiaColor := SkiaColor fromColor: aColor.
	self assert: aSkiaColor red equals: 255.
	self assert: aSkiaColor green equals: 0.
	self assert: aSkiaColor blue equals: 0.
	self assert: aSkiaColor alpha equals: 127.
	
	^ aColor
]

{ #category : #accessing }
SkiaColorExamples >> fromColorWhite [
	<gtExample>
	| aColor aSkiaColor |
	
	aColor := Color white alpha: 0.5.
	aSkiaColor := SkiaColor fromColor: aColor.
	self assert: aSkiaColor red equals: 255.
	self assert: aSkiaColor green equals: 255.
	self assert: aSkiaColor blue equals: 255.
	self assert: aSkiaColor alpha equals: 127.
	
	^ aColor
]
