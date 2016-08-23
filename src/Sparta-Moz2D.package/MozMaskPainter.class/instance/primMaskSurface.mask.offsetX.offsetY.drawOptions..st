private - ffi
primMaskSurface: aSourcePattern mask: aMaskSurface offsetX: offsetX offsetY: offsetY drawOptions: aMoz2DDrawOptions

	^ self ffiCall: #(void moz2d_draw_target_mask_surface (
		DrawTarget canvas,
		MozNativePattern aSourcePattern,
		SourceSurface aMaskSurface,
		float offsetX,
		float offsetY,
		DrawOptions aMoz2DDrawOptions))