Class {
	#name : #MozExamples,
	#superclass : #Object,
	#traits : 'TSpartaExamples',
	#classTraits : 'TSpartaExamples classTrait',
	#category : 'Sparta-Moz2D-Examples'
}

{ #category : #'instance creation' }
MozExamples class >> canvas: anExtent [
	^ MozCanvas extent: anExtent
]

{ #category : #private }
MozExamples class >> clear: aCanvas [
	aCanvas fill
		paint: Color white;
		path: (0@0 extent: aCanvas extent);
		draw.

	aCanvas fill
		paint: Color white;
		path: (0@0 extent: aCanvas extent);
		drawOptions: (aCanvas drawOptions
			composeDestOut);
		draw.
]

{ #category : #examples }
MozExamples class >> exampleDisplacementMap [
	| path canvas |	
		
	canvas := MozCanvas extent: 500@500.

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

	canvas stroke
		paint: Color red;
		path: path;
		strokeOptions: (canvas strokeOptions
			width: 5);
		draw.

	canvas filter
		area: (0@0 extent: 300@350);
		type: (canvas displacementMapFilter
			scale: 30;
			xChannelGreen;
			yChannelRed;
			source: canvas surface;
			secondSource: (canvas turbulenceFilter
				baseFrequence: 0.01;
				numOctaves: 2;
				seed: 231;
				area: (0@0 extent: 300@350);
				turbulence));
		draw.

	canvas asForm asMorph openInWindowLabeled: 'Displacement'
]

{ #category : #examples }
MozExamples class >> exampleGaussianBlur [
	|radial path canvas |	
	
	canvas := MozCanvas extent: 400@400.
	
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
		
	canvas asForm asMorph openInWindowLabeled: 'Shape + Blur'
]

{ #category : #examples }
MozExamples class >> exampleMultilanguageText [
	|canvas font |
	canvas := MozCanvas extent: 700@200.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
	
	canvas transform
		translateBy: 100@50;
		apply.

	font := canvas font
		size: 28;
		weightThin;
		sansSerif;
		build.

	canvas text
		string: 'Sparta  Спарта  斯巴達  سپارٹا  ස්පාටා';
		font: font;
		baseline: 20@30;
		draw;
		string: '😂🙈🚀';
		baseline: 20@60;
		draw.

	canvas asForm asMorph openInWindowLabeled: 'Text'
]

{ #category : #examples }
MozExamples class >> exampleNeonFilter [
	| canvas neonFilter font surfacePaint |
	canvas := MozCanvas extent: 800@500.

	canvas transform push.
	canvas transform
		set: (SpartaMatrix new shy: (-0.2));
		apply.

	font := canvas font
		size: 150;
		named: 'Sancreek';
		cursive;
		build.

	canvas text
		string: 'Sparta';
		font: font;
		fill;
		baseline: 170@300;
		draw.

	canvas transform pop.

	neonFilter := self neonFilterOn: canvas.
	canvas filter
		area: canvas bounds;
		type: neonFilter;
		draw.

	surfacePaint := canvas paint surface
		source: canvas.

	canvas fill
		paint: (Color fromHexString: '69008C');
		path: canvas bounds;
		draw;
		paint: surfacePaint;
		draw.

	canvas asForm asMorph openInWindowLabeled: 'Neon'
]

{ #category : #examples }
MozExamples class >> exampleStrokePath [
	| canvas path |

	canvas := MozCanvas extent: 400@400.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
		
	path := canvas path
		moveTo: 200@100;
		lineTo: 300@300;
		lineTo: 100@300;
		close;
		finish.

	canvas stroke
		paint: Color red;
		path: path;
		width: 5;
		joinRound;
		dashPattern: #(10 10);
		dashOffset: 11;
		draw.
	
	canvas asForm asMorph openInWindowLabeled: 'Vector Path'
]

{ #category : #examples }
MozExamples class >> exampleTextDutch [
	|canvas font |
	canvas := MozCanvas extent: 700@200.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
	
	canvas transform
		translateBy: 100@50;
		apply.

	font := canvas font
		size: 28;
		language: 'nl';
		stretchUltraExpanded;
		named: 'Helvetica Neue';
		sansSerif;
		build.

	canvas text
		paint: Color red;
		string: 'IJselijk koud is het IJ, maar altijd dichtbij.';
		font: font;
		baseline: 20@30;
		draw.

	canvas asForm asMorph openInWindowLabeled: 'Text'
]

{ #category : #'examples - text' }
MozExamples class >> exampleTextHorizontal [
	<gtExample>
	|canvas font |
	canvas := MozCanvas extent: 700@200.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
	
	canvas transform
		translateBy: 100@50;
		push.

	font := canvas font
		size: 28;
		weightThin;
		sansSerif;
		build.

	canvas text
		horizontal;
		string: 'Horizontal';
		font: font;
		baseline: 20@30;
		draw.
	
	canvas transform pop.
	
	^ canvas
]

{ #category : #examples }
MozExamples class >> exampleTextSmall [
	|canvas font |
	canvas := MozCanvas extent: 700@200.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
	
	canvas transform
		translateBy: 100@50;
		apply.

	font := canvas font
		size: 13;
		weightThin;
		sansSerif;
		build.

	canvas text
		string: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry';
		font: font;
		baseline: 10@30;
		draw.

	canvas asForm asMorph openInWindowLabeled: 'Text with small font'
]

{ #category : #'examples - text' }
MozExamples class >> exampleTextVerticalMixed [
	<gtExample>
	|canvas font |
	canvas := MozCanvas extent: 200@700.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
	
	canvas transform
		translateBy: 100@50;
		push.

	font := canvas font
		size: 28;
		weightThin;
		sansSerif;
		build.

	canvas text
		verticalMixed;
		string: 'Vertical mixed';
		font: font;
		baseline: 20@30;
		draw.

	^ canvas
]

{ #category : #'examples - text' }
MozExamples class >> exampleTextVerticalSidewaysLeft [
	<gtExample>
	|canvas font |
	canvas := MozCanvas extent: 200@700.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
	
	canvas transform
		translateBy: 100@50;
		push.

	font := canvas font
		size: 28;
		weightThin;
		sansSerif;
		build.

	canvas text
		verticalSidewaysLeft;
		string: 'Vertical sideways left';
		font: font;
		baseline: 20@300;
		draw.

	^ canvas
]

{ #category : #'examples - text' }
MozExamples class >> exampleTextVerticalSidewaysRight [
	<gtExample>
	|canvas font |
	canvas := MozCanvas extent: 200@700.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
	
	canvas transform
		translateBy: 100@50;
		push.

	font := canvas font
		size: 28;
		weightThin;
		sansSerif;
		build.

	canvas text
		verticalSidewaysRight;
		string: 'Vertical sideways right';
		font: font;
		baseline: 20@30;
		draw.

	^ canvas
]

{ #category : #'examples - text' }
MozExamples class >> exampleTextVerticalUpRight [
	<gtExample> 
	|canvas font |
	canvas := MozCanvas extent: 200@700.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
	
	canvas transform
		translateBy: 100@50;
		push.

	font := canvas font
		size: 28;
		weightThin;
		sansSerif;
		build.

	canvas text
		verticalUpright;
		string: 'Vertical upright';
		font: font;
		baseline: 20@30;
		draw.

	^ canvas
]

{ #category : #examples }
MozExamples class >> exampleTurbulence [
	| canvas |

	canvas := MozCanvas extent: 400@400.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	canvas filter
		area: canvas bounds;
		type: (canvas turbulenceFilter
			baseFrequence: 0.1;
			stitchable: true;
			area: canvas bounds;
			turbulence);
		draw.
		
	canvas asForm asMorph openInWindowLabeled: 'Turbulence'
]

{ #category : #'instance creation' }
MozExamples class >> neonFilterOn: canvas [

| sourceAlpha colGreenL colGreenM colGreenD colRedL colRedD colTransparent
	greenBevelLow10 greenBevelLow20 greenBevelLow30
	greenBevelUp00 greenBevelUp10 greenBevelUp20 greenBevelUp30
	greenFrontLow00 greenFrontLow10 greenFrontLow20 greenFrontLow30
	greenFrontUp10 greenFrontUp20 greenFrontUp30 greenFrontUp40
	shadedBevels00 shadedBevels10 shadedBevels30
	redBevelUp00 redBevelUp10 redBevelUp20
	redFrontUp00 redFrontUp10 redFrontUp20 redFrontUp30
	innerLine00 innerLine10 innerLine20 innerLine30 innerLine40
	result |

"Extract alpha channel from source surface"
sourceAlpha := 	canvas discreteTransferFilter
		disableRed: false;
		tableRed: 0.0;
		disableGreen: false;
		tableGreen: 0.0;
		disableBlue: false;
		tableBlue: 0.0;
		disableAlpha: true;
		source: canvas.

"Colors"
colGreenL := canvas floodFilter
	color: (Color fromHexString: '4CFED7').
colGreenM := canvas floodFilter
	color: (Color fromHexString: '0A4D39').
colGreenD := canvas floodFilter
	color: (Color fromHexString: '2A9B83').
colRedL := canvas floodFilter
	color: (Color fromHexString: 'FA5C71').
colRedD := canvas floodFilter
	color: (Color fromHexString: 'A5122B').
colTransparent := canvas floodFilter
	color: (Color transparent).

"Lower Green Bevel"
greenBevelLow10 := canvas morphologyFilter
	radius: 10;
	dilate;
	source: sourceAlpha.

greenBevelLow20 := canvas convolveMatrixFilter
	order: 8@8;
	divisor: 1;
	matrix: #(
		1 0 0 0 0 0 0 0
		0 1 0 0 0 0 0 0
		0 0 1 0 0 0 0 0
		0 0 0 1 0 0 0 0
		0 0 0 0 1 0 0 0
		0 0 0 0 0 1 0 0
		0 0 0 0 0 0 1 0
		0 0 0 0 0 0 0 1 );
	source: greenBevelLow10.

greenBevelLow30 := canvas compositeFilter
	in; "changed!"
	source: greenBevelLow20;
	source: colGreenD.

"Lower Green Front"
greenFrontLow00 := canvas compositeFilter
	in; "changed!"
	source: greenBevelLow10;
	source: colGreenL.
	
greenFrontLow10 := canvas transformFilter
	matrix: (SpartaMatrix translation: 4@4);
	source: greenFrontLow00.

greenFrontLow20 := canvas specularPointLightFilter
	surfaceScale: 0;
	positionX: 0 y: -30 z: 400;
	specularConstant: 0.75;
	specularExponent: 30;
	color: Color white;
	source: greenFrontLow10.
	
greenFrontLow30 := canvas compositeFilter
	out; "changed!"
	source: greenFrontLow20;
	source: greenFrontLow10.

"Upper Green Bevel"
greenBevelUp00 := canvas morphologyFilter
	radius: 7;
	dilate;
	source: sourceAlpha.

greenBevelUp10 := canvas convolveMatrixFilter
	order: 8@8;
	divisor: 1;
	matrix: #(
		1 0 0 0 0 0 0 0
		0 1 0 0 0 0 0 0
		0 0 1 0 0 0 0 0
		0 0 0 1 0 0 0 0
		0 0 0 0 1 0 0 0
		0 0 0 0 0 1 0 0
		0 0 0 0 0 0 1 0
		0 0 0 0 0 0 0 1 );
	source: greenBevelUp00.

greenBevelUp20 := canvas compositeFilter
	in;
	source: greenBevelUp10;
	source: colGreenD.

greenBevelUp30 := canvas transformFilter
	matrix: (SpartaMatrix translation: 9@9);
	source: greenBevelUp20.

"Upper Green Front"
greenFrontUp10 := canvas transformFilter
	matrix: (SpartaMatrix translation: 18@18);
	source: greenBevelUp00.

greenFrontUp20 := canvas compositeFilter
	in; "changed!"
	source: greenFrontUp10;
	source: colGreenL.

greenFrontUp30 := canvas specularPointLightFilter
	surfaceScale: 0;
	specularConstant: 0.75;
	specularExponent: 40;
	color: Color white;
	positionX: 120 y: 170 z: 500;
	source: greenFrontUp20.

greenFrontUp40 := canvas compositeFilter
	in; "changed!"
	source: greenFrontUp10;
	source: greenFrontUp30.

"Bevels and Front shaded"
shadedBevels00 := canvas compositeFilter
	over;
	source: greenBevelLow10;
	source: greenFrontLow30;
	source: greenBevelUp30;
	source: greenFrontUp20;
	source: greenFrontUp40;
	source: colTransparent.

shadedBevels10 := canvas specularPointLightFilter
	surfaceScale: 0;
	specularConstant: 0.45;
	specularExponent: 30;
	color: Color white;
	positionX: 250 y: 200 z: 500;
	source: shadedBevels00.

shadedBevels30 := canvas compositeFilter
	in; "changed!"
	source: shadedBevels00;
	source: shadedBevels10.

"Upper Red Bevel"
redBevelUp00 := canvas convolveMatrixFilter
	order: 4@4;
	divisor: 1;
	matrix: #(
		1 0 0 0
		0 1 0 0
		0 0 1 0
		0 0 0 1 );
	source: sourceAlpha.

redBevelUp10 := canvas compositeFilter
	in; "changed!"
	source: redBevelUp00;
	source: colRedD.

redBevelUp20 := canvas transformFilter
	matrix: (SpartaMatrix translation: 20@20);
	source: redBevelUp10.

"Upper Red Front"
redFrontUp00 := canvas compositeFilter
	in;  "changed!"
	source: sourceAlpha;
	source: colRedL.

redFrontUp10 := canvas transformFilter
	matrix: (SpartaMatrix translation: 24@24);
	source: redFrontUp00.

redFrontUp20 := canvas specularPointLightFilter
	surfaceScale: 0;
	specularConstant: 0.45;
	specularExponent: 30;
	color: Color white;
	positionX: 20 y: 180 z: 300;
	source: redFrontUp10.
	
redFrontUp30 := canvas compositeFilter
	in; "changed!"
	source: redFrontUp10;
	source: redFrontUp20.

"Inner Line"
innerLine00 := canvas morphologyFilter
	radius: 4;
	source: sourceAlpha.
	
innerLine10 := canvas morphologyFilter
	radius: 5;
	source: sourceAlpha.
	
innerLine20 := canvas compositeFilter
	out; "changed!"
	source: innerLine10;
	source: innerLine00.
	
innerLine30 := canvas compositeFilter
	in; "changed!"
	source: innerLine20;
	source: colGreenL.

innerLine40 := canvas transformFilter
	matrix: (SpartaMatrix translation: 24@24);
	source: innerLine30.

"Final merge"
result := canvas compositeFilter
	over;
	source: shadedBevels00;
	source: shadedBevels30;
	source: redBevelUp20;
	source: redFrontUp10;
	source: redFrontUp30;
	source: innerLine40;
	source: colTransparent.
	
^ result
]
