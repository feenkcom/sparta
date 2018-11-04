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

	canvas asForm asMorph openInWindow
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

{ #category : #examples }
TSpartaExamples >> donut [
	<gtExample>
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
