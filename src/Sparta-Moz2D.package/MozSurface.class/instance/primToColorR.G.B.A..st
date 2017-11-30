private - ffi
primToColorR: r G: g B: b A: a

	^ self ffiCall: #(MozSurface moz2d_source_surface_to_color (
		self,
		uint8 r,
		uint8 g,
		uint8 b,
		uint8 a ))