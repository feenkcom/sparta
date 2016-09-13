accessing
reset
	super reset.
	
	drawMode := nil.
	orientation := MozTextOrientation HORIZONTAL.
	breakPriority := MozTextBreakPriority eNormalBreak