api
path: aFillRuleSymbol
	"Start building a vector path with a provided fill rule as a symbol.
	User gets a path builder responsible for path creation.
	See !TSpartaPathBuilder for available api.
	
	(canvas path: #nonzero)
		moveTo: 150@50;
		lineTo: 250@250;
		curveVia: 150@300 to: 50@250;
		close;
		finish.
		
	(canvas path: #evenodd)
		moveTo: 150@50;
		lineTo: 250@250;
		curveVia: 150@300 to: 50@250;
		close;
		finish.
	"
	<return: #TSpartaPathBuilder>

	^ (self pathBuilder: aFillRuleSymbol)
		reset;
		canvas: self;
		yourself