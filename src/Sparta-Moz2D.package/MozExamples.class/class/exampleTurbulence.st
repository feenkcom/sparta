examples
exampleTurbulence
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