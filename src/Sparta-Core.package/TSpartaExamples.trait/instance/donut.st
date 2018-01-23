examples
donut
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