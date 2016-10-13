private - ffi
primGetHyphenWidth: aPropertyProvider

	^ self ffiCall: #(float moz2d_text_run_property_provider_get_hyphen_width (MozTextPropertyProvider aPropertyProvider))