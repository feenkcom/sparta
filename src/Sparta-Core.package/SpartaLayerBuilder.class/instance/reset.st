initialize-release
reset
	super reset.
	
	alpha := 1.0.
	transformation := SpartaMatrix new.
	area := nil.
	mask := nil.
	shouldCopy := false.
	isOpaque := false