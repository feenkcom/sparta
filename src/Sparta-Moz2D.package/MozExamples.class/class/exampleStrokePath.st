examples
exampleStrokePath
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