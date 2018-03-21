private - ffi
primSurfaceDestroy: aHandle

	^ self ffiCall: #(void moz2d_draw_target_cairo_surface_destroy (void* aHandle))