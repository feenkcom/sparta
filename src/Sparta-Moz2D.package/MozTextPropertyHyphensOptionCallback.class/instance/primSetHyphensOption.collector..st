private - ffi
primSetHyphensOption: aHyphensOption collector: aPropertyCollector

	^ self ffiCall: #( void moz2d_text_run_property_collector_set_hyphens_option (void* aPropertyCollector, int aHyphensOption ) )