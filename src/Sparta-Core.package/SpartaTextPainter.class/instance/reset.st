initialize-release
reset
	super reset.
	
	drawOptions := nil.
	strokeOptions := nil.
	font := nil.
	paint := Color black.
	strokePaint := Color transparent.
	baseline := 0@0.
	string := nil.
	start := nil.
	end := nil.
	spacing := 0.
	clip := false.
	self horizontal