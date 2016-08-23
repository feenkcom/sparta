accessing
seed: aNumber
	"The starting number for the pseudo random number generator.
	If the attribute is not specified, then the effect is as if a value of 0 were specified. When the seed number is handed over to the 	algorithm above it must first be truncated, i.e. rounded to the closest integer value towards zero."
	self
		primSetAttributeInt: aNumber
		index: MozTurbulenceFilterAtts ATT_TURBULENCE_SEED