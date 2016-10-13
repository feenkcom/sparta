private - ffi
primIsValid: aPropertyProvider

	^ self ffiCall: #(bool moz2d_text_run_property_provider_is_valid (MozTextPropertyProvider aPropertyProvider))