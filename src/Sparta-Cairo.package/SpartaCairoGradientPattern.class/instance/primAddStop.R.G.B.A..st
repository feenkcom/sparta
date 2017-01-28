private - ffi
primAddStop: anOffset R: aRed G: aGreen B: aBlue A: anAlpha

	^ self ffiCall: #(void cairo_pattern_add_color_stop_rgba (
			self,
			double anOffset,
			double aRed,
			double aGreen,
			double aBlue,
			double anAlpha ) )