accessing
turbulence
	"Indicates whether the filter primitive should perform a noise or turbulence function.
	If attribute ‘type’ is not specified, then the effect is as if a value of turbulence were specified."
	self
		primSetAttributeEnum: MozTurbulenceFilterType TURBULENCE_TYPE_TURBULENCE
		index: MozTurbulenceFilterAtts ATT_TURBULENCE_TYPE