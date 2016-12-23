private - ffi
primSetDrawTarget: aDrawTarget collector: aPropertyCollector

	^ self ffiCall: #( void moz2d_text_run_property_collector_set_draw_target (void* aPropertyCollector, MozCanvas aDrawTarget ) )