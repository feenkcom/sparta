private - ffi
primMaskPattern: aSourcePattern mask: aMaskPattern drawOptions: aMoz2DDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_mask_pattern (
		MozCanvas canvas,
		MozNativePattern aSourcePattern,
		MozNativePattern aMaskPattern,
		MozDrawOptions aMoz2DDrawOptions ) )