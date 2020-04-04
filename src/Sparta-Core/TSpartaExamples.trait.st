Trait {
	#name : #TSpartaExamples,
	#category : #'Sparta-Core-Examples'
}

{ #category : #'instance creation' }
TSpartaExamples classSide >> canvas: anExtent [
	^ self explicitRequirement
]

{ #category : #examples }
TSpartaExamples classSide >> example18plus [
	| canvas path linear stroke sphere radial |
	
	canvas := self canvas: 500@500.

	canvas transform push.
	canvas fill
		path: (0@0 extent: canvas extent);
		paint: Color white;
		draw;
		paint: ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.22);
		draw.
	
	canvas transform
		translateBy: canvas extent / 2 - (100@100);
		apply.

	path := canvas path
		moveTo: 50@0;
		ccwArcTo: 100@50 angle: Float pi * 3 / 2;
		ccwArcTo: 150@0 angle: Float pi * 3 / 2;
		finish.

	linear := canvas paint linearGradient
		stops: {
			0 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.5).
			0.2 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.8).
			0.3 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.8).
			0.5 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.9).
			1 -> (Color r: 	241 g: 194 b: 125 range: 255) };
		begin: 0@0;
		end: 0@100.
	
	stroke := canvas paint linearGradient
		stops: {
			0 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.1).
			0.2 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.9).
			0.3 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 0.9).
			0.5 -> ((Color r: 255 g: 219 b: 172 range: 255) alpha: 1).
			1 -> (Color r: 	198 g: 134 b: 66 range: 255) };
		begin: 0@0;
		end: 0@100.

	canvas fill
		paint: linear;
		path: path;
		draw.
	
	canvas stroke
		paint: stroke;
		path: path;
		draw.
	
	radial := canvas paint radialGradient
		stops: {
			0 -> (Color r: 141 g: 85 b: 36 range: 255).
			0.5 -> (Color pink).
			1 -> (Color r: 198 g: 134 b: 66 range: 255). };
		outerRadius: 5;
		outerCenter: 0@0.

	sphere := canvas shape circleAt: 0@0 radius: 5.

	canvas transform
		translateBy: 50@70;
		apply.

	canvas fill
		paint: radial;
		path: sphere;
		draw.

	canvas transform
		translateBy: 100@0;
		apply.

	canvas fill
		paint: radial;
		path: sphere;
		draw.
	
	canvas transform pop.

	^ canvas
]

{ #category : #examples }
TSpartaExamples classSide >> exampleDonut [
	^ self new donut asForm asMorph openInWindow
]

{ #category : #examples }
TSpartaExamples classSide >> exampleFillPath [
	| path canvas |
	
	canvas := self canvas: 500@500.

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

	canvas fill
		paint: Color red;
		path: path;
		draw;
		paint: (Color blue alpha: 0.5);
		draw.

	canvas asForm asMorph openInWindow
]

{ #category : #examples }
TSpartaExamples classSide >> exampleFillPathLinearGradient [
	| path canvas |
	
	canvas := self canvas: 500@500.
	
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

	canvas fill
		paint: (canvas paint linearGradient
			begin: 200@100;
			end: 300@300;
			stops: {
				0 -> Color red.
				1 -> Color blue
			});
		path: path;
		draw.

	canvas asForm asMorph openInWindow
]

{ #category : #examples }
TSpartaExamples classSide >> exampleFillRectangle [
	| canvas |
	
	canvas := self canvas: 500@500.
	
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
		
	canvas fill
		paint: Color red;
		path: (100@100 extent: 200@200);
		draw.

	canvas asForm asMorph openInWindow
]

{ #category : #'examples - path arc around' }
TSpartaExamples >> arc_0_to_0 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		arcAround: 100@100 radius: 50 startAngle: 0 endAngle: 0;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc around' }
TSpartaExamples >> arc_0_to_180 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		arcAround: 100@100 radius: 50 startAngle: 0 endAngle: Float pi;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc around' }
TSpartaExamples >> arc_0_to_270 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		arcAround: 100@100 radius: 50 startAngle: 0 endAngle: Float pi * (3.0 / 2.0);
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc around' }
TSpartaExamples >> arc_0_to_360 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		arcAround: 100@100 radius: 50 startAngle: 0 endAngle: Float pi * 2;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.
	
	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc around' }
TSpartaExamples >> arc_0_to_450 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		arcAround: 100@100 radius: 50 startAngle: 0 endAngle: Float pi * (5.0 /2.0);
		build.
		
	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc around' }
TSpartaExamples >> arc_0_to_90 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		arcAround: 100@100 radius: 50 startAngle: 0 endAngle: Float pi / 2.0;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc around' }
TSpartaExamples >> arc_0_to_minus_270 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		arcAround: 100@100 radius: 50 startAngle: 0 endAngle: Float pi * (3.0 / 2.0) negated;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc around' }
TSpartaExamples >> arc_0_to_minus_360 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		arcAround: 100@100 radius: 50 startAngle: 0 endAngle: (Float pi * 2) negated;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.
	
	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc around' }
TSpartaExamples >> arc_0_to_minus_90 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		arcAround: 100@100 radius: 50 startAngle: 0 endAngle: (Float pi / 2.0) negated;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc around' }
TSpartaExamples >> arc_90_to_180 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		arcAround: 100@100 radius: 50 startAngle: Float pi / 2.0 endAngle: Float pi;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc to' }
TSpartaExamples >> arc_ccw_from_100_100_to_100_100_angle_360 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 100@100;
		arcTo: 100@100 angle: Float pi * 2 cw: false;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc to' }
TSpartaExamples >> arc_ccw_from_100_100_to_100_200_angle_180 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 100@100;
		arcTo: 100@200 angle: Float pi cw: false;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc to' }
TSpartaExamples >> arc_ccw_from_100_100_to_150_150_angle_270 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 100@100;
		arcTo: 150@150 angle: Float pi * 3.0 / 2.0 cw: false;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc to' }
TSpartaExamples >> arc_ccw_from_100_100_to_150_150_angle_270_negated [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 100@100;
		arcTo: 150@150 angle: Float pi * 3.0 / 2.0 negated cw: false;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc to' }
TSpartaExamples >> arc_ccw_from_100_100_to_150_150_angle_90 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 100@100;
		arcTo: 150@150 angle: Float pi / 2.0 cw: false;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc to' }
TSpartaExamples >> arc_ccw_from_100_100_to_150_150_angle_90_negated [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 100@100;
		arcTo: 150@150 angle: Float pi / 2.0 negated cw: false;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc to' }
TSpartaExamples >> arc_ccw_from_100_100_to_50_150_angle_270 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 100@100;
		arcTo: 50@150 angle: Float pi * 3.0 / 2.0 cw: false;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc to' }
TSpartaExamples >> arc_cw_from_100_100_to_100_100_angle_360 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 100@100;
		arcTo: 100@100 angle: Float pi * 2 cw: true;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc to' }
TSpartaExamples >> arc_cw_from_100_100_to_100_200_angle_180 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 100@100;
		arcTo: 100@200 angle: Float pi cw: true;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc to' }
TSpartaExamples >> arc_cw_from_100_100_to_150_150_angle_90 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 100@100;
		arcTo: 150@150 angle: Float pi / 2.0 cw: true;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc to' }
TSpartaExamples >> arc_cw_from_100_100_to_50_150_angle_270 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 100@100;
		arcTo: 50@150 angle: Float pi * 3.0 / 2.0 cw: true;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #'examples - path arc to' }
TSpartaExamples >> arc_cw_from_100_200_to_50_150_angle_90 [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 100@200;
		arcTo: 50@150 angle: Float pi / 2.0 cw: true;
		build.

	aCanvas fill
		paint: (Color gray alpha: 0.2);
		path: aPath;
		draw.

	aCanvas stroke
		paint: Color black;
		path: aPath;
		width: 2;
		draw.

	^ aCanvas
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkClipRectangle [
	<gtExample>
	<noTest>
	| aCanvas aRectangle |

	aCanvas := self class canvas: 300@200.
	aCanvas fill
		path: aCanvas bounds;
		paint: Color white;
		draw.

	aRectangle := 50@50 corner: 250@150.
		
	^ [ aCanvas clip
			by: aRectangle
			during: [  ] ] benchFor: 2 seconds
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkClipSubRectangle [
	<gtExample>
	<noTest>
	| aCanvas aRectangle aSubRectangle |

	aCanvas := self class canvas: 300@200.
	aCanvas fill
		path: aCanvas bounds;
		paint: Color white;
		draw.

	aRectangle := 50@50 corner: 250@150.
	aSubRectangle := 100@100 corner: 400@300.
		
	^ [ aCanvas clip
			by: aRectangle
			during: [
				aCanvas clip
					by: aSubRectangle
					during: [  ] ] ] benchFor: 2 seconds
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkDrawTextAtRandomLocations [
	<gtExample>
	<noTest>
	| extent amount points words canvas font |

	extent := 1000@1000.
	amount := 100000.

	points := amount timesCollect: [ (10@30) + ((extent x - 50) atRandom @ (extent y - 50) atRandom) ].
	words := amount timesCollect: [ ((4 + 10 atRandom) timesCollect: [ ($a to: $z) atRandom ]) as: String ].

	canvas := self class canvas: 1000@1000.

	font := canvas font
		named: 'Source Code Pro';
		size: 14;
		build.

	^ MessageTally on: [	
	words with: points do: [ :word :point |
		canvas text
			font: font;
			string: word;
			baseline: point;
			draw ] ]
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkDrawTextWithBlackColor [
	<gtExample>
	<noTest>
	| aCanvas aFont aText |

	aCanvas := self class canvas: 300@200.
	aCanvas fill
		path: aCanvas bounds;
		paint: Color white;
		draw.

	aFont := aCanvas font build.

	aText := aCanvas text
		font: aFont;
		string: 'Hello world! Hello world! Hello world!';
		textRun.
		
	^ [ aCanvas text
		baseline: 10@50;
		font: aFont;
		text: aText;
		paint: Color black;
		draw ] benchFor: 2 seconds
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkDrawTextWithOpaqueColor [
	<gtExample>
	<noTest>
	| aCanvas aFont aText |

	aCanvas := self class canvas: 300@200.
	aCanvas fill
		path: aCanvas bounds;
		paint: Color white;
		draw.

	aFont := aCanvas font build.

	aText := aCanvas text
		font: aFont;
		string: 'Hello world! Hello world! Hello world!';
		textRun.
		
	^ [ aCanvas text
		baseline: 10@50;
		font: aFont;
		text: aText;
		paint: (Color brown);
		draw ] benchFor: 2 seconds
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkDrawTextWithSemiTransparentColor [
	<gtExample>
	<noTest>
	| aCanvas aFont aText |

	aCanvas := self class canvas: 300@200.
	aCanvas fill
		path: aCanvas bounds;
		paint: Color white;
		draw.

	aFont := aCanvas font build.

	aText := aCanvas text
		font: aFont;
		string: 'Hello world! Hello world! Hello world!';
		textRun.
		
	^ [ aCanvas text
		baseline: 10@50;
		font: aFont;
		text: aText;
		paint: (Color red alpha: 0.4);
		draw ] benchFor: 2 seconds
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkFillRectangleWithBlackColor [
	<gtExample>
	<noTest>
	| aCanvas aRectangle aColor |

	aCanvas := self class canvas: 300@200.
	aCanvas fill
		path: aCanvas bounds;
		paint: Color white;
		draw.

	aRectangle := 50@50 corner: 250@150.
	aColor := Color black.
		
	^ [ aCanvas fill
		path: aRectangle;
		paint: aColor;
		draw ] benchFor: 2 seconds
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkFillRectangleWithForm [
	<gtExample>
	<noTest>
	| aCanvas aRectangle aForm |
	
	aCanvas := self class canvas: 300@200.
	aCanvas fill
		path: aCanvas bounds;
		paint: Color white;
		draw.
	
	aRectangle := 50@50 corner: 250@150.
	
	aForm := Form extent: aRectangle extent depth: 32.
	aForm fillColor: Color veryLightGray.
	aForm fill: (aForm boundingBox insetBy: 25) fillColor: Color gray.	
		
	[ 10000 timesRepeat: [ aCanvas fill
		path: aRectangle;
		paint: aForm;
		draw ] ] timeProfile.
		
	
	^ [ aCanvas fill
		path: aRectangle;
		paint: aForm;
		draw ] benchFor: 2 seconds
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkFillRectangleWithOpaqueColor [
	<gtExample>
	<noTest>
	| aCanvas aRectangle aColor |

	aCanvas := self class canvas: 300@200.
	aCanvas fill
		path: aCanvas bounds;
		paint: Color white;
		draw.
		
	aRectangle := 50@50 corner: 250@150.
	aColor := Color brown.
		
	^ [ aCanvas fill
		path: aRectangle;
		paint: aColor;
		draw ] benchFor: 2 seconds
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkFillRectangleWithWhiteColor [
	<gtExample>
	<noTest>
	| aCanvas aRectangle aColor |

	aCanvas := self class canvas: 300@200.
	aCanvas fill
		path: aCanvas bounds;
		paint: Color white;
		draw.
		
	aRectangle := 50@50 corner: 250@150.
	aColor := Color white.
		
	^ [ aCanvas fill
		path: aRectangle;
		paint: aColor;
		draw ] benchFor: 2 seconds
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkFillRoundedRectangleWithOpaqueColorNoPathCache [
	<gtExample>
	<noTest>
	| aCanvas aRectangle aColor |

	aCanvas := self class canvas: 300@200.
	aCanvas fill
		path: aCanvas bounds;
		paint: Color white;
		draw.
		
	aRectangle := 50@50 corner: 250@150.
	aColor := Color brown.
		
	^ [ aCanvas fill
		path: (aCanvas shape roundedRectangle: aRectangle radii: #(20 30 40 50));
		paint: aColor;
		draw ] benchFor: 2 seconds
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkFillSimpleRoundedRectangleWithOpaqueColor [
	<gtExample>
	<noTest>
	| aCanvas aRectangle aColor |

	aCanvas := self class canvas: 300@200.
	aCanvas fill
		path: aCanvas bounds;
		paint: Color white;
		draw.
		
	aRectangle := aCanvas shape roundedRectangle: (50@50 corner: 250@150) radii: #(20 20 20 20).
	aColor := Color brown.
		
	^ [ aCanvas fill
		path: aRectangle;
		paint: aColor;
		draw ] benchFor: 2 seconds
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkFillSimpleRoundedRectangleWithOpaqueColorNoPathCache [
	<gtExample>
	<noTest>
	| aCanvas aRectangle aColor |

	aCanvas := self class canvas: 300@200.
	aCanvas fill
		path: aCanvas bounds;
		paint: Color white;
		draw.
		
	aRectangle := 50@50 corner: 250@150.
	aColor := Color brown.
		
	^ [ aCanvas fill
		path: (aCanvas shape roundedRectangle: aRectangle radii: #(20 20 20 20));
		paint: aColor;
		draw ] benchFor: 2 seconds
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkTextRunWithMetrics [
	<gtExample>
	<noTest>
	| aCanvas aFont aString |

	aCanvas := self class canvas: 300@200.
	aFont := aCanvas font build.
	aString := 'Hello world!'.
	
	^ [ 
		| aTextPainter |
		aTextPainter := aCanvas text font: aFont; string: aString.
		aTextPainter textRunWithMetrics: aTextPainter metrics
	 ] benchFor: 2 seconds
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkTransformCurrentMatrix [
	<gtExample>
	<noTest>
	| aCanvas |

	aCanvas := self class canvas: 300@200.
	^ [ aCanvas transform current ] benchFor: 2 seconds
]

{ #category : #benchmarks }
TSpartaExamples >> benchmarkTransformTranslateBy [
	<gtExample>
	<noTest>
	| aCanvas aDelta |

	aCanvas := self class canvas: 300@200.
	aCanvas fill
		path: aCanvas bounds;
		paint: Color white;
		draw.

	aDelta := 100@50.
		
	^ [ aCanvas transform
			by: [ :t | t translateBy: aDelta ]
			during: [  ] ] benchFor: 2 seconds
]

{ #category : #'examples - clip circle' }
TSpartaExamples >> clipCircle [
	<gtExample>
	| aCanvas |
	
	aCanvas := self class canvas: 400@300.

	self assert: aCanvas clip globalBounds equals: aCanvas bounds.
	
	"no clip"
	aCanvas fill
		path: aCanvas bounds;
		paint: (Color gray alpha: 0.1);
		draw.
	
	aCanvas clip
		by: (aCanvas shape circleAt: (150@150) radius: 100)
		during: [
			self assert: aCanvas clip globalBounds equals: (50@50 extent: 200@200).
	
			"root clip"
			aCanvas fill
				path: aCanvas bounds;
				paint: (Color gray alpha: 0.3);
				draw ].

	^ aCanvas
]

{ #category : #'examples - clip rectangle' }
TSpartaExamples >> clipRectangleOnce [
	<gtExample>
	| aCanvas |
	
	aCanvas := self class canvas: 400@300.

	self assert: aCanvas clip globalBounds equals: aCanvas bounds.
	
	"no clip"
	aCanvas fill
		path: aCanvas bounds;
		paint: (Color gray alpha: 0.1);
		draw.
	
	aCanvas clip
		by: (0@0 extent: 300@250)
		during: [
			self assert: aCanvas clip globalBounds equals: (0@0 extent: 300@250).
	
			"root clip"
			aCanvas fill
				path: aCanvas bounds;
				paint: (Color gray alpha: 0.3);
				draw ].

	^ aCanvas
]

{ #category : #'examples - clip rectangle' }
TSpartaExamples >> clipRectangleTwice [
	<gtExample>
	| aCanvas |
	
	aCanvas := self class canvas: 400@300.
	
	self assert: aCanvas clip globalBounds equals: aCanvas bounds.

	"no clip"
	aCanvas fill
		path: aCanvas bounds;
		paint: (Color gray alpha: 0.1);
		draw.
	
	aCanvas clip
		by: (0@0 extent: 300@250)
		during: [
			self assert: aCanvas clip globalBounds equals: (0@0 extent: 300@250).

			"root clip"
			aCanvas fill
				path: aCanvas bounds;
				paint: (Color gray alpha: 0.3);
				draw.
			
			aCanvas clip
				by: (50@50 extent: 300@250)
				during: [
					self assert: aCanvas clip globalBounds equals: (50@50 extent: 250@200).
					
					"nested clip"
					aCanvas fill
						path: aCanvas bounds;
						paint: (Color gray alpha: 0.3);
						draw ] ].

	^ aCanvas
]

{ #category : #'examples - clip rounded rectangle' }
TSpartaExamples >> clipRoundedRectangle [
	<gtExample>
	| aCanvas |
	
	aCanvas := self class canvas: 400@300.

	self assert: aCanvas clip globalBounds equals: aCanvas bounds.
	
	"no clip"
	aCanvas fill
		path: aCanvas bounds;
		paint: (Color gray alpha: 0.1);
		draw.
	
	aCanvas clip
		by: (aCanvas shape roundedRectangle: (0@0 extent: 300@250) radii: #(30 30 30 30))
		during: [
			self assert: aCanvas clip globalBounds equals: (0@0 extent: 300@250).
	
			"root clip"
			aCanvas fill
				path: aCanvas bounds;
				paint: (Color gray alpha: 0.3);
				draw ].

	^ aCanvas
]

{ #category : #examples }
TSpartaExamples >> donut [
	| path canvas |
	
	canvas := self class canvas: 400@400.
	path := (canvas path: #evenodd)
		moveTo: 300@200;
		arcAround: 200@200
			radius: 100
			startAngle: 0 endAngle: Float pi * 2;
		moveTo: 250@200;
		arcAround: 200@200
			radius: 50
			startAngle: 0 endAngle: Float pi * 2;
		close;
		build.

	canvas fill
		paint: (Color gray alpha: 0.4);
		path: path;
		draw.

	canvas stroke
		paint: (Color gray);
		path: path;
		draw.
		
	^ canvas
]

{ #category : #'examples - image filter blur' }
TSpartaExamples >> drawCanvasWithBlurTo [
	<gtExample>
	| aSourceCanvas aDestinationCanvas |
	aSourceCanvas := self fillTriangleWithLinearGradient.
	
	aDestinationCanvas := self class canvas: 600@500.
	aDestinationCanvas filter
		type: (aDestinationCanvas filters blur
			source: aSourceCanvas;
			stdDeviation: 20);
		to: 100@50;
		draw.

	^ aDestinationCanvas
]

{ #category : #'examples - gradient linear' }
TSpartaExamples >> drawLinearGradient [
	<gtExample>
	| aCanvas aGradient |

	aCanvas := self class canvas: 400@400.
	aGradient := aCanvas paint linearGradient
		begin: 0@0;
		end: 400@400;
		stops: { 0 -> Color blue . 1 -> Color red }.
	
	aCanvas fill
		path: aCanvas bounds;
		paint: aGradient;
		draw.

	^ aCanvas
]

{ #category : #'examples - gradient linear' }
TSpartaExamples >> drawLinearGradientMiddleStops [
	<gtExample>
	| aCanvas aGradient |

	aCanvas := self class canvas: 400@400.
	aGradient := aCanvas paint linearGradient
		begin: 0@0;
		end: 400@400;
		stops: { 0.2 -> Color blue . 0.6 -> Color red }.
	
	aCanvas fill
		path: aCanvas bounds;
		paint: aGradient;
		draw.

	^ aCanvas
]

{ #category : #'examples - gradient linear' }
TSpartaExamples >> drawLinearGradientPartial [
	<gtExample>
	| aCanvas aGradient |

	aCanvas := self class canvas: 400@400.
	aGradient := aCanvas paint linearGradient
		begin: 0@0;
		end: 400@400;
		stops: { 0 -> Color blue . 1 -> Color red }.
	
	aCanvas fill
		path: (100@100 corner: 300@300);
		paint: aGradient;
		draw.

	^ aCanvas
]

{ #category : #'examples - gradient radial' }
TSpartaExamples >> drawRadialGradient [
	<gtExample>
	| aCanvas aGradient |

	aCanvas := self class canvas: 400@400.
	aGradient := aCanvas paint radialGradient
		center: 200@200;
		radius: 200;
		stops: { 0 -> Color blue . 1 -> Color red }.
	
	aCanvas fill
		path: aCanvas bounds;
		paint: aGradient;
		draw.

	^ aCanvas
]

{ #category : #'examples - gradient radial' }
TSpartaExamples >> drawRadialGradientMiddleStops [
	<gtExample>
	| aCanvas aGradient |

	aCanvas := self class canvas: 400@400.
	aGradient := aCanvas paint radialGradient
		center: 200@200;
		radius: 200;
		stops: { 0.2 -> Color blue . 0.6 -> Color red }.
	
	aCanvas fill
		path: aCanvas bounds;
		paint: aGradient;
		draw.

	^ aCanvas
]

{ #category : #'examples - gradient radial' }
TSpartaExamples >> drawRadialGradientPartial [
	<gtExample>
	| aCanvas aGradient |

	aCanvas := self class canvas: 400@400.
	aGradient := aCanvas paint radialGradient
		center: 200@200;
		radius: 200;
		stops: { 0 -> Color blue . 1 -> Color red }.
	
	aCanvas fill
		path: (100@100 corner: 300@300);
		paint: aGradient;
		draw.

	^ aCanvas
]

{ #category : #'benchmarks - figure' }
TSpartaExamples >> figureRectangleWithoutBorder [
	<gtExample>
	<noTest>
	| aCanvas aRectangle aColor |

	aCanvas := self class canvas: 300@200.
	aCanvas fill
		path: aCanvas bounds;
		paint: Color white;
		draw.
		
	aRectangle := 50@50 corner: 250@150.
	aColor := Color brown.
		
	^ [ aCanvas figure
			path: aRectangle;
			background: aColor;
			backgroundAlpha: 1.0;
			border: Color transparent;
			borderAlpha: 1.0;
			width: 0.0;
			draw ] benchFor: 2 seconds
]

{ #category : #'examples - fill circle' }
TSpartaExamples >> fillCircleWithGrayColor [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.
	
	aCanvas fill
		path: (aCanvas shape circleAt: 200@150 radius: 100);
		paint: Color lightGray;
		draw.

	^ aCanvas
]

{ #category : #'examples - fill rectangle' }
TSpartaExamples >> fillRectangleSurface [
	<gtExample>
	| aCanvas anImageCanvas |

	aCanvas := self class canvas: 400@300.
	
	anImageCanvas := self class canvas: 200@100.
	anImageCanvas fill
		path: anImageCanvas bounds;
		paint: Color red;
		draw.
	
	aCanvas fill
		path: (100@100 corner: 300@200);
		paint: anImageCanvas;
		draw.

	^ aCanvas
]

{ #category : #'examples - fill rectangle' }
TSpartaExamples >> fillRectangleWithGrayColor [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.
	
	aCanvas fill
		path: (100@100 corner: 300@200);
		paint: Color lightGray;
		draw.

	^ aCanvas
]

{ #category : #'examples - fill rectangle' }
TSpartaExamples >> fillRectangleWithLinearGradient [
	<gtExample>
	| aCanvas aPaint |

	aCanvas := self class canvas: 400@300.
	
	aPaint := aCanvas paint linearGradient
		begin: 50@50;
		end: 300@200;
		stops: { 0 -> Color blue . 1 -> Color red }.
	
	aCanvas fill
		path: (50@50 corner: 350@250);
		paint: aPaint;
		draw.

	^ aCanvas
]

{ #category : #'examples - fill rectangle' }
TSpartaExamples >> fillRectangleWithRadialGradient [
	<gtExample>
	| aCanvas aPaint |

	aCanvas := self class canvas: 400@300.
	
	aPaint := aCanvas paint radialGradient
		center: 200@150;
		radius: 150;
		stops: { 0 -> Color blue . 1 -> Color red }.
	
	aCanvas fill
		path: (50@50 corner: 350@250);
		paint: aPaint;
		draw.

	^ aCanvas
]

{ #category : #'examples - fill rounded rectangle' }
TSpartaExamples >> fillRoundedRectangleWithGrayColor [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.
	
	aCanvas fill
		path: (aCanvas shape roundedRectangle: (100@100 corner: 300@200) radii: #(20 30 40 50));
		paint: Color lightGray;
		draw.

	^ aCanvas
]

{ #category : #'examples - fill triangle' }
TSpartaExamples >> fillTriangleWithGrayColor [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 200@50;
		lineTo: 350@250;
		lineTo: 50@250;
		close;
		build.
	
	aCanvas fill
		path: aPath;
		paint: Color lightGray;
		draw.

	^ aCanvas
]

{ #category : #'examples - fill triangle' }
TSpartaExamples >> fillTriangleWithLinearGradient [
	<gtExample>
	| aCanvas aPath aPaint |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 200@50;
		lineTo: 350@250;
		lineTo: 50@250;
		close;
		build.

	aPaint := aCanvas paint linearGradient
		begin: 50@250;
		end: 275@150;
		stops: { 0 -> Color blue . 1 -> Color red }.
	
	aCanvas fill
		path: aPath;
		paint: aPaint;
		draw.

	^ aCanvas
]

{ #category : #'examples - fill triangle' }
TSpartaExamples >> fillTriangleWithRadialGradient [
	<gtExample>
	| aCanvas aPath aPaint |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 200@50;
		lineTo: 350@250;
		lineTo: 50@250;
		close;
		build.

	aPaint := aCanvas paint radialGradient
		center: 200@170;
		radius: 125;
		stops: { 0 -> Color blue . 1 -> Color red }.
	
	aCanvas fill
		path: aPath;
		paint: aPaint;
		draw.

	^ aCanvas
]

{ #category : #'examples - fill rectangle' }
TSpartaExamples >> fillTwoRectanglesWithColorsAndAlpha [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.
	
	aCanvas fill
		path: (50@50 corner: 200@150);
		paint: (Color blue alpha: 0.5);
		alpha: 0.5;
		draw.
		
	aCanvas fill
		path: (100@100 corner: 250@200);
		paint: Color red;
		alpha: 0.5;
		draw.

	^ aCanvas
]

{ #category : #'examples - fill rectangle' }
TSpartaExamples >> fillTwoRectanglesWithColorsAndAlphaComposeSource [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.
	
	aCanvas fill
		path: (50@50 corner: 200@150);
		paint: (Color blue alpha: 0.5);
		alpha: 0.5;
		draw.
		
	aCanvas fill
		path: (100@100 corner: 250@200);
		paint: Color red;
		composeSource;
		alpha: 0.5;
		draw.

	^ aCanvas
]

{ #category : #'examples - fill rectangle' }
TSpartaExamples >> fillTwoRectanglesWithColorsSemiTransparent [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.
	
	aCanvas fill
		path: (50@50 corner: 200@150);
		paint: (Color blue alpha: 0.5);
		draw.
		
	aCanvas fill
		path: (100@100 corner: 250@200);
		paint: (Color red alpha: 0.5);
		draw.

	^ aCanvas
]

{ #category : #examples }
TSpartaExamples >> mario [
	<gtExample>
	| mario colors pixel canvas |

	mario := #(
		(0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1)
		(0 0 0 0 0 0 2 2 2 2 2 0 0 0 1 1)
		(0 0 0 0 0 2 2 2 2 2 2 2 2 2 1 1)
		(0 0 0 0 0 3 3 3 1 1 3 1 0 3 3 3)
		(0 0 0 0 3 1 3 1 1 1 3 1 1 3 3 3)
		(0 0 0 0 3 1 3 3 1 1 1 3 1 1 1 3)
		(0 0 0 0 3 3 1 1 1 1 3 3 3 3 3 0)
		(0 0 0 0 0 0 1 1 1 1 1 1 1 3 0 0)
		(0 0 3 3 3 3 3 2 3 3 3 2 3 0 0 0)
		(0 3 3 3 3 3 3 3 2 3 3 3 2 0 0 3)
		(1 1 3 3 3 3 3 3 2 2 2 2 2 0 0 3)
		(1 1 1 0 2 2 3 2 2 1 2 2 1 2 3 3)
		(0 1 0 3 2 2 2 2 2 2 2 2 2 2 3 3)
		(0 0 3 3 3 2 2 2 2 2 2 2 2 2 3 3)
		(0 3 3 3 2 2 2 2 2 2 2 0 0 0 0 0)
		(0 3 0 0 2 2 2 2 0 0 0 0 0 0 0 0)).
		
	colors := { 
		0 -> (Color fromHexString: #FFFFFF).
		1 -> (Color fromHexString: #F6A502).
		2 -> (Color fromHexString: #D30301).
		3 -> (Color fromHexString: #'6B5200')
	} asDictionary.

	pixel := 32.

	canvas := self class canvas: pixel * mario size asPoint.

	mario withIndexDo: [ :eachRow :y |
		eachRow withIndexDo: [ :dot :x |
			canvas fill
				path: ((x@y - 1) * pixel extent: pixel asPoint);
				paint: (colors at: dot);
				draw ] ].
	^ canvas
]

{ #category : #'examples - transformation' }
TSpartaExamples >> rotateFillRectangle [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.
	aCanvas fill
		path: (50@50 extent: 100@75);
		paint: (Color gray alpha: 0.4);
		draw.

	aCanvas transform
		by: [ :t | t rotateByDegrees: 10 ]
		during: [
			aCanvas fill
				path: (50@50 extent: 100@75);
				paint: (Color red alpha: 0.4);
				draw ].

	^ aCanvas
	
	
]

{ #category : #'examples - transformation' }
TSpartaExamples >> scaleFillRectangle [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.
	aCanvas fill
		path: (50@50 extent: 100@75);
		paint: (Color gray alpha: 0.4);
		draw.

	aCanvas transform
		by: [ :t | t scaleBy: 1.5 ]
		during: [
			aCanvas fill
				path: (50@50 extent: 100@75);
				paint: (Color red alpha: 0.4);
				draw ].

	^ aCanvas
	
	
]

{ #category : #examples }
TSpartaExamples >> shadow [
	| canvas floating |

	canvas := self class canvas: 500@300.
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	floating := self class canvas: 100@100.
	floating fill
		paint: (Color gray alpha: 1);
		path: (floating shape ellipse: (floating bounds insetBy: 20));
		draw.

	canvas shadow
		destination: 0@0;
		offset: 8@10;
		sigma: 6;
		color: (Color black alpha: 0.7);
		source: floating;
		draw.

	^ canvas
]

{ #category : #'examples - stroke circle' }
TSpartaExamples >> strokeCircleWithBoxShadow [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.

	aCanvas stroke
		path: (aCanvas shape circleAt: 200@150 radius: 100);
		paint: (aCanvas paint boxShadow
			radius: 20;
			offset: 20@20;
			color: (Color black alpha: 0.5));
		"width plays a role of a spread"
		width: 5;
		draw.

	^ aCanvas
]

{ #category : #'examples - stroke circle' }
TSpartaExamples >> strokeCircleWithGrayColor [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.

	aCanvas stroke
		path: (aCanvas shape circleAt: 200@150 radius: 100);
		paint: Color lightGray;
		width: 5;
		draw.

	^ aCanvas
]

{ #category : #'examples - stroke line' }
TSpartaExamples >> strokeLineWithGrayColor [
	<gtExample>
	| aCanvas aLine |

	aCanvas := self class canvas: 400@300.
	aLine := SpartaLine from: 50@150 to: 350 @ 150.

	aCanvas stroke
		path: aLine;
		paint: Color lightGray;
		width: 20;
		draw.

	^ aCanvas
]

{ #category : #'examples - stroke line' }
TSpartaExamples >> strokeLineWithGrayColorCapButt [
	<gtExample>
	| aCanvas aLine |

	aCanvas := self class canvas: 400@300.
	aLine := SpartaLine from: 50@150 to: 350 @ 150.

	aCanvas stroke
		path: aLine;
		paint: Color lightGray;
		width: 20;
		capButt;
		draw.
		
	aCanvas stroke
		path: aLine;
		paint: Color black;
		width: 1;
		draw.

	^ aCanvas
]

{ #category : #'examples - stroke line' }
TSpartaExamples >> strokeLineWithGrayColorCapRound [
	<gtExample>
	| aCanvas aLine |

	aCanvas := self class canvas: 400@300.
	aLine := SpartaLine from: 50@150 to: 350 @ 150.

	aCanvas stroke
		path: aLine;
		paint: Color lightGray;
		width: 20;
		capRound;
		draw.
		
	aCanvas stroke
		path: aLine;
		paint: Color black;
		width: 1;
		draw.

	^ aCanvas
]

{ #category : #'examples - stroke line' }
TSpartaExamples >> strokeLineWithGrayColorCapSquare [
	<gtExample>
	| aCanvas aLine |

	aCanvas := self class canvas: 400@300.
	aLine := SpartaLine from: 50@150 to: 350 @ 150.

	aCanvas stroke
		path: aLine;
		paint: Color lightGray;
		width: 20;
		capSquare;
		draw.
		
	aCanvas stroke
		path: aLine;
		paint: Color black;
		width: 1;
		draw.

	^ aCanvas
]

{ #category : #'examples - stroke rectangle' }
TSpartaExamples >> strokeRectangleWithBoxShadow [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.

	aCanvas stroke
		path: (100@100 corner: 300@200);
		paint: (aCanvas paint boxShadow
			radius: 20;
			offset: 20@20;
			color: (Color black alpha: 0.5));
		"width plays a role of a spread"
		width: 5;
		draw.

	^ aCanvas
]

{ #category : #'examples - stroke rectangle' }
TSpartaExamples >> strokeRectangleWithGrayColor [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.

	aCanvas stroke
		path: (100@100 corner: 300@200);
		paint: Color lightGray;
		width: 5;
		draw.

	^ aCanvas
]

{ #category : #'examples - stroke rounded rectangle' }
TSpartaExamples >> strokeRoundedRectangleWithBoxShadow [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.

	aCanvas stroke
		path: (aCanvas shape roundedRectangle: (100@100 corner: 300@200) radii: #(20 30 40 50));
		paint: (aCanvas paint boxShadow
			radius: 20;
			offset: 20@20;
			color: (Color black alpha: 0.5));
		width: 5;
		draw.

	^ aCanvas
]

{ #category : #'examples - stroke rounded rectangle' }
TSpartaExamples >> strokeRoundedRectangleWithGrayColor [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.

	aCanvas stroke
		path: (aCanvas shape roundedRectangle: (100@100 corner: 300@200) radii: #(20 30 40 50));
		paint: Color lightGray;
		width: 5;
		draw.

	^ aCanvas
]

{ #category : #'examples - stroke triangle' }
TSpartaExamples >> strokeTriangleWithGrayColor [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 200@50;
		lineTo: 350@250;
		lineTo: 50@250;
		close;
		build.
	
	aCanvas stroke
		path: aPath;
		paint: Color lightGray;
		width: 10;
		draw.

	^ aCanvas
]

{ #category : #'examples - text run' }
TSpartaExamples >> textRunWithMetrics [
	<gtExample>
	| aCanvas |
	
	aCanvas := self class canvas: 50@50.
	
	^ aCanvas text
		font: aCanvas font build;
		string: 'Hello world!';
		textRunWithMetrics
]

{ #category : #'examples - transformation' }
TSpartaExamples >> translateAndClipFillRectangle [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.
	aCanvas fill
		path: (50@50 extent: 100@75);
		paint: (Color gray alpha: 0.4);
		draw.
	
	aCanvas clip
		by: (100@75 extent: 100@75)
		during: [
			aCanvas transform
				by: [ :t | t translateBy: 50@25 ]
				during: [
					aCanvas fill
						path: (50@50 extent: 100@75);
						paint: (Color red alpha: 0.4);
						draw ] ].
				
	aCanvas clip
		by: (150@125 extent: 100@75)
		during: [
			aCanvas transform
				by: [ :t | t translateBy: 100@75 ]
				during: [
					aCanvas fill
						path: (50@50 extent: 100@75);
						paint: (Color red alpha: 0.4);
						draw ] ].

	aCanvas transform
		by: [ :t | t translateBy: 100@75 ]
		during: [	
			aCanvas clip
				by: (50@50 extent: 100@75)
				during: [
					aCanvas fill
						path: (0@0 extent: 100@75);
						paint: (Color blue alpha: 0.4);
						draw ] ].

	^ aCanvas
	
	
]

{ #category : #'examples - transformation' }
TSpartaExamples >> translateFillRectangle [
	<gtExample>
	| aCanvas |

	aCanvas := self class canvas: 400@300.
	aCanvas fill
		path: (50@50 extent: 100@75);
		paint: (Color gray alpha: 0.4);
		draw.
		
	aCanvas transform
		by: [ :t | t translateBy: 50@25 ]
		during: [
			aCanvas fill
				path: (50@50 extent: 100@75);
				paint: (Color red alpha: 0.4);
				draw ].

	^ aCanvas
	
	
]

{ #category : #'examples - path' }
TSpartaExamples >> trianglePathAbsolute [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		absolute;
		moveTo: 200@50;
		lineTo: 350@250;
		lineTo: 50@250;
		close;
		build.

	^ aPath
]

{ #category : #'examples - path' }
TSpartaExamples >> trianglePathRelative [
	<gtExample>
	| aCanvas aPath |

	aCanvas := self class canvas: 400@300.
	
	aPath := aCanvas path
		relative;
		moveTo: 200@50;
		lineTo: 150@200;
		lineTo: -300@0;
		close;
		build.

	^ aPath
]
