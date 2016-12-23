private - ffi
primGetSpacing: aPropertyCollector

	^ self ffiCall: #( void* moz2d_text_run_spacing_collector_get_spacing ( void* aPropertyCollector ) )