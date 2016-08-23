private - ffi
primMaskPattern: aSourcePattern mask: aMaskPattern drawOptions: aMoz2DDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_mask_pattern (
		DrawTarget canvas,
		MozNativePattern aSourcePattern,
		MozNativePattern aMaskPattern,
		DrawOptions aMoz2DDrawOptions ) )