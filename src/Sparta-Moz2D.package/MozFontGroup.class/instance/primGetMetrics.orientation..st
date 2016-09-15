private - ffi
primGetMetrics: aMetrics orientation: isVertical

	^ self ffiCall: #(void moz2d_font_group_metrics (
		self,
		MozFontMetrics aMetrics,
		bool isVertical ) )