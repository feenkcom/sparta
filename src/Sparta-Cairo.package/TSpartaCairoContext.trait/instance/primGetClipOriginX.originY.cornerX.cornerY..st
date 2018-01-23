private - ffi
primGetClipOriginX: anOriginX originY: anOriginY cornerX: aCornerX cornerY: aCornerY

	^ self ffiCall: #(void cairo_clip_extents (
			SpartaCairoCanvas canvas,
			double *anOriginX,
			double *anOriginY,
			double *aCornerX,
			double *aCornerY ) )