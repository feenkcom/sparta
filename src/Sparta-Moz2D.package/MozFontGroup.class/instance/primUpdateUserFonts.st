private - ffi
primUpdateUserFonts

	^ self ffiCall: #(void moz2d_font_group_update_user_fonts(self))