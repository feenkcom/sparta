private - ffi
primGetClipGlobal: aRectangle

	^ self ffiCall: #(void moz2d_draw_target_clipping_bounds_global (MozCanvas canvas, MozNativeRect aRectangle))