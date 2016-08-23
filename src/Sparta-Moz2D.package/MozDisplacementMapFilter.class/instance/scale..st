accessing
scale: aFloat
	"Displacement scale factor. The amount is expressed in the coordinate system established by attribute ‘primitiveUnits’ on the ‘filter’ element.
	When the value of this attribute is 0, this operation has no effect on the source image.
	If the attribute is not specified, then the effect is as if a value of 0 were specified."
	self
		primSetAttributeFloat: aFloat
		index: MozDisplacementMapFilterAtts ATT_DISPLACEMENT_MAP_SCALE