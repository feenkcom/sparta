private
primDrawFilter: aFilter sourceRectangle: aMoz2DRect destX: destX destY: destY drawOptions: aMoz2DDrawOptions

	^ self ffiCall: #(void moz2d_draw_target_draw_filter(
		MozCanvas canvas,
		MozFilter aFilter,
		MozNativeRect aMoz2DRect,
		float destX,
		float destY,
		MozDrawOptions aMoz2DDrawOptions))