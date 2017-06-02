private - ffi
primStrokeExtent: aCanvas originX: originX originY: originY cornerX: aCornerX cornerY: aCornerY

	self ffiCall: #(void cairo_stroke_extents (
		SpartaCairoCanvas aCanvas,
		double *originX,
		double *originY,
		double *aCornerX,
		double *aCornerY))