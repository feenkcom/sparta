private - ffi
primGetStatus
	^ self ffiCall: #(MozGfxFeatureStatus moz_gfx_config_get_feature_status(self))