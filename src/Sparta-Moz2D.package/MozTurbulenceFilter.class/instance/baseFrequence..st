accessing
baseFrequence: aPointOrFloat
	"The base frequency (frequencies) parameter(s) for the noise function.
	If two <number>s are provided, the first number represents a base frequency in the X direction and the second value represents a base frequency in the Y direction. If one number is provided, then that value is used for both X and Y. A negative value for base frequency is an error.
	If the attribute is not specified, then the effect is as if a value of 0 were specified."

	self
		privateSetAttributeSize: aPointOrFloat
		index: MozTurbulenceFilterAtts ATT_TURBULENCE_BASE_FREQUENCY