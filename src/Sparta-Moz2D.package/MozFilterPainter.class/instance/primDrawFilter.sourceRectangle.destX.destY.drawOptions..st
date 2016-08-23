private
primDrawFilter: aFilter sourceRectangle: aMoz2DRect destX: destX destY: destY drawOptions: aMoz2DDrawOptions

	^ self ffiCall: #(void moz2d_draw_target_draw_filter(
		DrawTarget canvas,
		FilterNode aFilter,
		MozNativeRect aMoz2DRect,
		float destX,
		float destY,
		DrawOptions aMoz2DDrawOptions))