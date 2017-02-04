private - ffi
primRefCount: aHandle

	^ self ffiCall: #( uint cairo_font_face_get_reference_count ( void* aHandle) )