private - ffi
primRelease: aHandle

	^ self ffiCall: #( void moz2d_font_user_set_release ( void* aHandle ) )