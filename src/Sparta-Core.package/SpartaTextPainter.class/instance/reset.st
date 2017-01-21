initialize-release
reset
	super reset.
	
	drawOptions := nil.
	strokeOptions := nil.
	font := nil.
	paint := Color black.
	strokePaint := Color transparent.
	baseline := 0@0.
	text := nil.
	start := nil.
	end := nil.
	spacing := 0.
	clip := false.
	maxWidth := Float infinity.
	self horizontal.
	self breakNormal