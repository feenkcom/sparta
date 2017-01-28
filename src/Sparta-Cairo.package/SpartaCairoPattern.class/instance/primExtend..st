private - ffi
primExtend: anExtendMode

	^ self ffiCall: #(void cairo_pattern_set_extend (
			self,
			SpartaCairoExtendMode anExtendMode ) )