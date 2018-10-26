Class {
	#name : #MozCrashTests,
	#superclass : #MozTestCase,
	#instVars : [
		'canvas'
	],
	#category : #'Sparta-Moz2D-Tests'
}

{ #category : #initialization }
MozCrashTests >> defaultExtent [
	^ 500@500
]

{ #category : #running }
MozCrashTests >> setUp [
	super setUp.
	
	canvas := MozCanvas extent: self defaultExtent
]

{ #category : #running }
MozCrashTests >> tearDown [
	super tearDown.

	canvas := nil
]

{ #category : #tests }
MozCrashTests >> testFill [
	| gradient ellipse options |
	gradient := canvas paint linearGradient
		stops: {
			0 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.1).
			0.2 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.9).
			0.3 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.9).
			0.5 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 1).
			1 -> (Color r: 	198 g: 134 b: 66 range: 255) };
		begin: 0@0;
		end: self defaultExtent.
	
	ellipse := canvas shape ellipse: canvas bounds.
	options := canvas drawOptions
		alpha: 0.5;
		antialiasGray;
		composeColorDodge;
		yourself.
	
	canvas fill
		paint: gradient;
		path: ellipse;
		drawOptions: options;
		draw.
		
]

{ #category : #tests }
MozCrashTests >> testFilter [
	|radial path |	
	
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	path := canvas path
		moveTo: 150@50;
		lineTo: 250@250;
		curveVia: 150@300 to: 50@250;
		close;
		finish.

	radial := canvas paint radialGradient
		innerCenter: 150@150;
		outerRadius: 100;
		stops: {0 -> Color white. 0.5 -> Color red. 1 -> Color white }.

	canvas fill
		paint: radial;
		path: path;
		draw.

	canvas stroke
		paint: Color blue;
		path: path;
		strokeOptions: (canvas strokeOptions
			width: 5);
		draw.
		
	canvas filter
		area: (0@0 extent: 300@350);
		type: (canvas gaussianBlurFilter
			stdDeviation: 5;
			source: canvas surface);
		drawOptions: (canvas drawOptions
			alpha: 0.7);
		draw.
]

{ #category : #tests }
MozCrashTests >> testFont [
	| font |
	font := canvas font
		size: 13;
		weightThin;
		sansSerif;
		build.
		
	self assert: font isNotNil
]

{ #category : #tests }
MozCrashTests >> testStroke [
	| gradient ellipse drawOptions strokeOptions |
	gradient := canvas paint linearGradient
		stops: {
			0 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.1).
			0.2 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.9).
			0.3 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.9).
			0.5 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 1).
			1 -> (Color r: 	198 g: 134 b: 66 range: 255) };
		begin: 0@0;
		end: self defaultExtent.
	
	ellipse := canvas shape ellipse: canvas bounds.
	
	drawOptions := canvas drawOptions
		alpha: 0.5;
		antialiasGray;
		composeColorDodge;
		yourself.
	
	strokeOptions := canvas strokeOptions
		capButt;
		dashOffset: 5;
		dashPattern: #(10 20);
		joinBevel;
		miterLimit: 12.3;
		width: 10;
		yourself.
	
	canvas stroke
		paint: gradient;
		path: ellipse;
		drawOptions: drawOptions;
		strokeOptions: strokeOptions;
		draw.
		
]

{ #category : #tests }
MozCrashTests >> testTextDraw [
	| gradient drawOptions strokeOptions font |
	gradient := canvas paint linearGradient
		stops: {
			0 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.1).
			0.2 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.9).
			0.3 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.9).
			0.5 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 1).
			1 -> (Color r: 	198 g: 134 b: 66 range: 255) };
		begin: 0@0;
		end: self defaultExtent.
	
	drawOptions := canvas drawOptions
		alpha: 0.5;
		antialiasGray;
		composeColorDodge;
		yourself.
	
	strokeOptions := canvas strokeOptions
		capButt;
		dashOffset: 5;
		dashPattern: #(10 20);
		joinBevel;
		miterLimit: 12.3;
		width: 10;
		yourself.
	
	font := canvas font
		size: 90;
		weightThin;
		sansSerif;
		build.
		
	canvas text
		baseline: 100@100;
		string: 'Sparta';
		font: font;
		paint: gradient;
		drawOptions: drawOptions;
		strokeOptions: strokeOptions;
		draw
		
]
