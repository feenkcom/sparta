private - ffi
primGetClipLocal: aRectangle

	^ self ffiCall: #(void moz2d_draw_target_clipping_bounds_local (MozCanvas canvas, MozNativeRect aRectangle))