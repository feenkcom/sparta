private - ffi
primSet: aPropertyProvider hyphensOption: aHyphensOption

	^ self ffiCall: #(void moz2d_text_run_property_provider_set_hyphens_option (
		MozTextPropertyProvider aPropertyProvider,
		MozTextHyphensOption aHyphensOption ) )