private - ffi
primEnableByDefault
	^ self ffiCall: #(void moz_gfx_config_feature_enable_by_default( self ))