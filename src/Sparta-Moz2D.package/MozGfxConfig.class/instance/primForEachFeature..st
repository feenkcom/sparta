private - ffi
primForEachFeature: aCallback

	^ self ffiCall: #(void moz_gfx_config_for_each_feature(FFICallback aCallback))