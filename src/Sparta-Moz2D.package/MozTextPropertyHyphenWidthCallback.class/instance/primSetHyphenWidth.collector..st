private - ffi
primSetHyphenWidth: aHyphenWidth collector: aPropertyCollector

	^ self ffiCall: #( void moz2d_text_run_property_collector_set_hyphen_width (void* aPropertyCollector, float aHyphenWidth ) )