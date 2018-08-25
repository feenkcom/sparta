Class {
	#name : #SpTextStrikethroughAttribute,
	#superclass : #SpAttribute,
	#instVars : [
		'paint',
		'width'
	],
	#category : 'Sparta-Core-Text-Model'
}

{ #category : #initialization }
SpTextStrikethroughAttribute >> defaultPaint [
	^ Color black
]

{ #category : #drawing }
SpTextStrikethroughAttribute >> drawAboveOn: aCanvas with: aSpan [
	| aLine fromPoint toPoint anOffset aSize aPaint |
	
	"Size can be redifined by the user. If not, take value provided by font metrics"
	aSize := width ifNil: [ aSpan strikethroughSize ].
	
	"Calculate a paint of the strikethrough line. User value has the highest priority,
	then goes foreground paint and finally default one returned by #defaultPaint"
	aPaint := paint ifNil: [ aSpan attributes
			detect: [ :anAttribute | anAttribute isKindOf: SpTextForegroundAttribute ]
			ifFound: [ :anAttribute | anAttribute paint ]
			ifNone: [ self defaultPaint ] ].
	self assert: [ aPaint isNotNil ] description: [ 'Strikethrough paint must be defined!' ].
	
	"Vertical offset from baseline"
	anOffset := aSpan strikethroughOffset.
	
	fromPoint := aSpan baseline - (0 @ anOffset).
	toPoint := fromPoint + (aSpan width @ 0).
	aLine := SpartaLine from: fromPoint to: toPoint.

	aCanvas stroke
		paint: aPaint;
		path: aLine;
		width: aSize;
		draw
]

{ #category : #accessing }
SpTextStrikethroughAttribute >> paint: aPaint [
	paint := aPaint
]

{ #category : #accessing }
SpTextStrikethroughAttribute >> width: aNumber [
	width := aNumber
]
