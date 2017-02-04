private - ffi
primAddRef: aHandle

	^ self ffiCall: #( void* cairo_font_face_reference ( void* aHandle) )