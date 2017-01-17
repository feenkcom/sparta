dispatch
secondSourceSurface: aSurface

	"Surfaces are ref counted, so no need to strong refer them"
	self primSetInputSurface: aSurface index: MozFilterInputs SECOND_INPUT