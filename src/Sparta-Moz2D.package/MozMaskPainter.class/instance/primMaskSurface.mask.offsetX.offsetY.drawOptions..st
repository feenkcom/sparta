private - ffi
primMaskSurface: aSourcePattern mask: aMaskSurface offsetX: offsetX offsetY: offsetY drawOptions: aMoz2DDrawOptions

	^ self ffiCall: #(void moz2d_draw_target_mask_surface (
		MozCanvas canvas,
		MozNativePattern aSourcePattern,
		MozSurface aMaskSurface,
		float offsetX,
		float offsetY,
		MozDrawOptions aMoz2DDrawOptions))