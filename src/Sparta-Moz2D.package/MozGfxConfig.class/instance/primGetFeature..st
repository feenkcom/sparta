private - ffi
primGetFeature: aFeatureType

	^ self ffiCall: #(MozGfxFeature moz_gfx_config_get_feature(MozGfxFeatureType aFeatureType))