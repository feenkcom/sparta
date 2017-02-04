private - ffi
primScaleX: aX Y: aY

	^ self ffiCall: #( void cairo_matrix_scale (
			self,
			double aX,
			double aY ) )