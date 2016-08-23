accessing
numOctaves: aNumber
	"The numOctaves parameter for the noise function.
	If the attribute is not specified, then the effect is as if a value of 1 were specified."
	self
		primSetAttributeInt: aNumber
		index: MozTurbulenceFilterAtts ATT_TURBULENCE_NUM_OCTAVES