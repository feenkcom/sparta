private - ffi
primSetDrawTargetCallback: aDrawTargetCallback

	^ self ffiCall: #(void moz2d_text_run_property_provider_init_draw_target_callback (
		self,
		MozTextPropertyDrawTargetCallback aDrawTargetCallback ) )