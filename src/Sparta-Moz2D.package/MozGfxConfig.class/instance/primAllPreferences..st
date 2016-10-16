private - ffi
primAllPreferences: aLength

	^ self ffiCall: #(FFIExternalArray moz_gfx_preferences_all(size_t *aLength ))