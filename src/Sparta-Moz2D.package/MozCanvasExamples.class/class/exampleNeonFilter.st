examples
exampleNeonFilter
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
		origin: 170@300;
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