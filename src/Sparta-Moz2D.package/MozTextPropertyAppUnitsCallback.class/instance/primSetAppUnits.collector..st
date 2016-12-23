private - ffi
primSetAppUnits: anAppUnits collector: aPropertyCollector

	^ self ffiCall: #( void moz2d_text_run_property_collector_set_app_units (void* aPropertyCollector, uint32 anAppUnits ) )