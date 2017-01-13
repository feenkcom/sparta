private - ffi
primGetSmalltalkPtr: aPropertyProvider

	^ self ffiCall: #(ulong moz2d_text_run_property_provider_get_smalltalk_ptr (MozTextPropertyProvider aPropertyProvider))