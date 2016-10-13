private - ffi
primIsEnabled
	
	^ self ffiCall: #(bool moz_gfx_config_feature_is_enabled( self ) )