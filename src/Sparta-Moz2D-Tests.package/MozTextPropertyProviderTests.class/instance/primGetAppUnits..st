private - ffi
primGetAppUnits: aPropertyProvider

	^ self ffiCall: #(uint32 moz2d_text_run_property_provider_get_app_units (MozTextPropertyProvider aPropertyProvider))