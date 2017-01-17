dispatch
sourceSurface: aSurface

	"Surfaces are ref counted, so no need to strong refer them"
	self primSetInputSurface: aSurface intIndex: self size.

	"increase counter by one"
	count := count + 1