private - ffi
primGetSpacing: aPropertyProvider start: aStart end: anEnd array: anArray 

	^ self ffiCall: #(void moz2d_text_run_property_provider_get_spacing (
		MozTextPropertyProvider aPropertyProvider,
		uint32 aStart,
		uint32 anEnd,
		double* anArray))