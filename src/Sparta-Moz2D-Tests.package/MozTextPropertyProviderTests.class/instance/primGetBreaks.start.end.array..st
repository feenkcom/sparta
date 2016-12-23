private - ffi
primGetBreaks: aPropertyProvider start: aStart end: anEnd array: anArray 

	^ self ffiCall: #(void moz2d_text_run_property_provider_get_breaks (
		MozTextPropertyProvider aPropertyProvider,
		uint32 aStart,
		uint32 anEnd,
		void* anArray ))