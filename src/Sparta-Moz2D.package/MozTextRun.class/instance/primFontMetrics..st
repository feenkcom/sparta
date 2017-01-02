private - ffi
primFontMetrics: aMetrics

	^ self ffiCall: #(void moz2d_text_run_font_metrics (
		self,
		#MozNativeFontMetrics aMetrics) )