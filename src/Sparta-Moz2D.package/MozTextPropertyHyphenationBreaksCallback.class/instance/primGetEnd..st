private - ffi
primGetEnd: aPropertyCollector

	^ self ffiCall: #( uint32 moz2d_text_run_breaks_collector_get_end ( void* aPropertyCollector ) )