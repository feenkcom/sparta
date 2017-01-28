examples
example18plus
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