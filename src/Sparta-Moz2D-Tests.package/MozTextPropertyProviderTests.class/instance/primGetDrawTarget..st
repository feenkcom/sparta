private - ffi
primGetDrawTarget: aPropertyProvider

	^ self ffiCall: #(void* moz2d_text_run_property_provider_get_draw_target (MozTextPropertyProvider aPropertyProvider))