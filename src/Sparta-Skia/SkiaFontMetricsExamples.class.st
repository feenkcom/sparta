Class {
	#name : #SkiaFontMetricsExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaFontMetricsExamples >> default [
	<gtExample>
	<return: #SkiaFontMetrics>
	| aFontMetrics |
	aFontMetrics := SkiaFontMetrics new.

	self assert: aFontMetrics ascent equals: 0.0.
	self assert: aFontMetrics averageCharWidth equals: 0.0.
	self assert: aFontMetrics bottom equals: 0.0.
	self assert: aFontMetrics capHeight equals: 0.0.
	self assert: aFontMetrics descent equals: 0.0.
	self assert: aFontMetrics descent equals: 0.0.
	self assert: aFontMetrics emHeight equals: 0.0.
	self assert: aFontMetrics maxCharWidth equals: 0.0.
	self assert: aFontMetrics strikeoutPosition equals: 0.0.
	self assert: aFontMetrics strikeoutThickness equals: 0.0.
	self assert: aFontMetrics top equals: 0.0.
	self assert: aFontMetrics underlinePosition equals: 0.0.
	self assert: aFontMetrics underlineThickness equals: 0.0.
	self assert: aFontMetrics xHeight equals: 0.0.
	self assert: aFontMetrics xMax equals: 0.0.
	self assert: aFontMetrics xMin equals: 0.0.

	^ aFontMetrics
]
