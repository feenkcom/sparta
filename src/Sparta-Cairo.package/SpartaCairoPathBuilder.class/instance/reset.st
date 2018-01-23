accessing
reset
	absolute := true.
	endPoint := 0@0.
	lastControlPoint := nil.
	
	"we must not reset fill rule, because it is set before #reset is called.
	Some rendering engines treat fillRule as an internal property of the path builder
	that can not be changed once builder is created"