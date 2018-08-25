Class {
	#name : #SpTextShadowAttribute,
	#superclass : #SpAttribute,
	#instVars : [
		'offset',
		'color',
		'radius'
	],
	#category : 'Sparta-Core-Text-Model'
}

{ #category : #accessing }
SpTextShadowAttribute >> color: aColor [
	color := aColor
]

{ #category : #drawing }
SpTextShadowAttribute >> drawBelowOn: aCanvas with: aSpan [
	| attributes font fontBuilder textPainter area shadowCanvas expand |
	
	expand := radius * Float pi.
	area := (aSpan box translateBy: aSpan baseline) expandBy: expand.

	shadowCanvas := aCanvas similar: area extent.

	attributes := aSpan attributes.
	fontBuilder := shadowCanvas font.
	textPainter := shadowCanvas text.

	attributes do: [ :attribute |
		attribute applyOnFont: fontBuilder with: aSpan.
		attribute applyOnText: textPainter with: aSpan ].

	font := fontBuilder build.

	textPainter
		paint: color;
		font: font;
		string: aSpan string;
		baseline: (aSpan box left negated + expand) @ aSpan ascent;
		draw.
	
	shadowCanvas filter
		area: shadowCanvas bounds;
		type: (shadowCanvas gaussianBlurFilter
			stdDeviation: radius;
			source: shadowCanvas surface);
		drawOptions: (shadowCanvas drawOptions
			alpha: 1);
		draw.

	aCanvas fill
		paint: shadowCanvas surface;
		path: (area translateBy: offset);
		draw.
]

{ #category : #initialization }
SpTextShadowAttribute >> initialize [
	super initialize.
	
	offset := 0@0.
	color := Color black.
	radius := 2
]

{ #category : #accessing }
SpTextShadowAttribute >> offset: aPoint [
	offset := aPoint
]

{ #category : #accessing }
SpTextShadowAttribute >> radius: aNumber [
	radius := aNumber
]
