Class {
	#name : #MozTextExamples,
	#superclass : #Object,
	#traits : 'TSpartaTextExamples',
	#classTraits : 'TSpartaTextExamples classTrait',
	#category : 'Sparta-Moz2D-Examples'
}

{ #category : #accessing }
MozTextExamples class >> canvas: anExtent [
	^ MozCanvas extent: anExtent
]

{ #category : #'examples - attributes' }
MozTextExamples class >> exampleForegroundGradient [
	| aCanvas aText |
	aCanvas := MozCanvas extent: 700 @ 500.
	aCanvas fill
		paint: Color white;
		path: aCanvas bounds;
		draw.
	aCanvas transform
		translateBy: 200 @ 200;
		apply.

	aText := SpText fromString: 'Foreground'.
	aText attributes: {
			SpTextForegroundAttribute paint: (SpLinearGradient new
				begin: 0@0;
				end: 200@0;
				stops: { 0 -> Color red. 1 -> Color blue } ).
			SpTextStrikethroughAttribute new.
			SpFontSizeAttribute size: 40 }.
	
	aCanvas text
		text: aText;
		draw.
	
	aCanvas asForm asMorph openInWindow
]

{ #category : #'examples - attributes' }
MozTextExamples class >> exampleSpacing [
	| aCanvas aText |
	aCanvas := MozCanvas extent: 700 @ 500.
	aCanvas fill
		paint: Color white;
		path: aCanvas bounds;
		draw.
	aCanvas transform
		translateBy: 200 @ 200;
		apply.

	aText := SpText fromString: 'Spacing 10'.
	aText attributes: {
			SpTextSpacingAttribute spacing: 10.
			SpFontSizeAttribute size: 40 }.
	
	aCanvas text
		text: aText;
		draw.
	
	aCanvas asForm asMorph openInWindow
]

{ #category : #'examples - text' }
MozTextExamples class >> exampleStyledText [
	| canvas text |
	canvas := MozCanvas extent: 600@400.
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	canvas transform
		translateBy: 20@50;
		apply.

	text := SpText fromString: 'Line 1', String cr, 'Line 2', String cr, 'Line 3', String cr, 'Line 4'.
	text attributes: { SpFontSizeAttribute new size: 35 } from: 1 to: text size.
	text attributes: { SpFontGenericFamilyAttribute new monospace } from: 1 to: 4.
	text attributes: { SpFontStyleAttribute new italic } from: 7 to: 12.
	text attributes: { SpTextForegroundAttribute paint: Color red } from: 3 to: 9.
	text attributes: { SpTextTransformationAttribute new translateBy: 20@0 } from: 15 to: 21.

	text drawOn: canvas.

	canvas asForm asMorph openInWindowLabeled: 'Sparta text'
]

{ #category : #'examples - text' }
MozTextExamples class >> exampleTextHaiku [
	<gtExample>
	| canvas rope textLayout |
	canvas := MozCanvas extent: 605 @ 265.
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	canvas transform
		translateBy: 50@20;
		apply.	

	rope := SpRope from: 'Soft words' , String cr , 'Brushing minds' , String cr , 'Are poetic gifts'.
	rope := rope
		attributes:
			{ SpTextForegroundAttribute paint: Color veryVeryDarkGray.
			  SpFontSizeAttribute size: 70.
			  SpTextWrapAttribute new normal.
			  SpTextShadowAttribute new
			    offset: 2 @ 2;
			    color: Color gray;
			    radius: 1 }
		from: 1 to: rope size.
	rope := rope
		attributes:
			{ SpFontStyleAttribute italic.
			  SpTextForegroundAttribute paint: Color darkGray.
			  SpFontWeightAttribute weight: 50 }
		from: 1
		to: 10.
	rope := rope
		attributes:
			{ SpTextForegroundAttribute paint: (SpLinearGradient new
				begin: 0@0;
				end: 500@0;
				stops: { 0 -> Color red. 1 -> Color blue }).
			  SpFontWeightAttribute weight: 800 }
		from: 26 to: rope size.
	textLayout := SpMultilineTextLayout rope: rope.
	textLayout renderOn: canvas.
	^ canvas
]

{ #category : #'examples - text' }
MozTextExamples class >> exampleTextHaikuFilter [
	| canvas rope textLayout |
	canvas := MozCanvas extent: (605 @ 265) * 3.
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	canvas transform
		push;
		scaleBy: 0.7;
		apply.
	
	canvas transform
		push;
		translateBy: 100@80;
		apply.	

	rope := SpRope from: '全身心自在' , String cr , '身感風如馭氣天' , String cr , '下雪富士山'.
	rope := rope
		attributes:
			{ SpTextForegroundAttribute paint: Color black.
			  SpFontSizeAttribute size: 200.
			  SpTextWrapAttribute new normal.
			  SpTextShadowAttribute new
			    offset: 2 @ 2;
			    color: Color gray;
			    radius: 1 }
		from: 1 to: rope size.
	rope := rope
		attributes:
			{ SpFontStyleAttribute italic.
			  SpTextStrikethroughAttribute new paint: Color blue.
			  SpTextForegroundAttribute paint: Color darkGray.
			  SpFontWeightAttribute weight: 50. }
		from: 1
		to: 5.
	rope := rope
		attributes:
			{ SpTextForegroundAttribute paint: (SpLinearGradient new
				begin: 0@0;
				end: 500@0;
				stops: { 0 -> Color red. 1 -> Color blue }).
			  SpFontWeightAttribute weight: 800 }
		from: 14 to: rope size.
	textLayout := SpMultilineTextLayout rope: rope.
	textLayout renderOn: canvas.
	
	canvas transform pop.
	
	canvas filter
		area: (canvas bounds);
		type: (canvas displacementMapFilter
			scale: 30;
			xChannelBlue;
			yChannelRed;
			source: canvas surface;
			secondSource: (canvas gaussianBlurFilter
				stdDeviation: 9;
				source: canvas));
		draw.
	
	canvas filter
		type: (canvas filters nashville: canvas);
		area: canvas bounds;
		draw.
		
	canvas := (canvas similar: 605 @ 265) fill
		path: (0@0 extent: 605 @ 265);
		paint: canvas;
		draw;
		canvas.
	
	canvas asForm asMorph openInWindowLabeled: 'Haiku'
]

{ #category : #'examples - text' }
MozTextExamples class >> exampleTextLayout [
	|canvas rope maxWidth textLayout |
	maxWidth := 310.

	canvas := MozCanvas extent: 700@500.
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	rope := SpRope from: 'abcdef🚀-12345', String cr, 'hijklmadadfsdgs', String cr, 'Hello World!'.
	rope := rope attributes: { SpFontSizeAttribute size: 70 } from: 1 to: rope size.
	rope := rope attributes: { SpTextWrapAttribute normal } from: 1 to: rope size.
	rope := rope attributes: { SpTextTransformationAttribute new
		scaleBy: 0.2 } from: 15 to: 30.

	textLayout := SpMultilineTextLayout new
		rope: rope
		maxWidth: maxWidth.
	textLayout renderOn: canvas.

	canvas stroke
		paint: Color red;
		path: (0@0 extent: textLayout extent);
		draw.
	
	canvas stroke
		paint: Color blue;
		path: (0@0 extent: maxWidth @ textLayout height);
		draw.

	canvas asForm asMorph openInWindow
]

{ #category : #'examples - text' }
MozTextExamples class >> exampleTextWithShadow [
	| canvas rope textLayout |
	canvas := MozCanvas extent: 565 @ 345.
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	canvas transform
		rotateByDegrees: 10;
		translateBy: 50@20;
		apply.	

	rope := SpRope from: 'Line 1' , String cr , 'Line 2' , String cr , 'Hello World!'.
	rope := rope
		attributes:
			{(SpTextForegroundAttribute paint: Color veryVeryDarkGray).
			(SpTextShadowAttribute new
				offset: 2 @ 2;
				color: Color gray;
				radius: 1).
			(SpFontSizeAttribute size: 70).
			(SpFontWeightAttribute weight: 50).
			SpTextWrapAttribute new normal}
		from: 1
		to: rope size.
	rope := rope
		attributes:
			{SpFontStyleAttribute italic.
			(SpTextForegroundAttribute paint: Color red)}
		from: 8
		to: 13.
	rope := rope attributes: {(SpFontWeightAttribute weight: 800)} from: 15 to: rope size.
	textLayout := SpMultilineTextLayout rope: rope.
	textLayout renderOn: canvas.
	canvas asForm asMorph openInWindowLabeled: 'Text with shadow'
]
