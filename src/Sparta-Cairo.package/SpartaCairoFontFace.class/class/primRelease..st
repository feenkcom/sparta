private - ffi
primRelease: aHandle

	^ self ffiCall: #( void cairo_font_face_destroy ( void* aHandle) )