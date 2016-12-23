private - ffi
primGetBreaks: aPropertyCollector

	^ self ffiCall: #( void* moz2d_text_run_breaks_collector_get_breaks ( void* aPropertyCollector ) )