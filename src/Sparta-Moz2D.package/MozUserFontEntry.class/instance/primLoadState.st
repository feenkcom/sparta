private - ffi
primLoadState

	^ self ffiCall: #(MozUserFontLoadState moz2d_font_user_entry_get_load_state (self))