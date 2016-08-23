accessing
area: aRectangle

	self
		primSetAttributeIntRectX: aRectangle left rounded
		y: aRectangle top rounded
		width: aRectangle width rounded
		height: aRectangle height rounded
		index: MozConvolveMatrixFilterAtts ATT_CONVOLVE_MATRIX_SOURCE_RECT