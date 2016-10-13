private - ffi
primGetHyphenOption: aPropertyProvider

	^ self ffiCall: #(int8 moz2d_text_run_property_provider_get_hyphens_option (MozTextPropertyProvider aPropertyProvider))