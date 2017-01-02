private - ffi
primFontMetrics: aMetrics textRun: aTextRun

	^ self ffiCall: #(void moz2d_text_run_font_metrics (
		MozTextRun aTextRun,
		MozNativeFontMetrics aMetrics) )