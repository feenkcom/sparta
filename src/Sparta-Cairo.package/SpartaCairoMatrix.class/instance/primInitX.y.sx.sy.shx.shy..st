private - ffi
primInitX: aX y: aY sx: aSx sy: aSy shx: aShX shy: aShY

	^ self ffiCall: #( void cairo_matrix_init (
			self,
			double aSx,
			double aShY,
			double aShX,
			double aSy,
			double aX,
			double aY ) )