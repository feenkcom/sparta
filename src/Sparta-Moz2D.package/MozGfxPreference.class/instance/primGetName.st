private - ffi
primGetName
	^ self ffiCall: #(String moz_gfx_preference_get_name (self))