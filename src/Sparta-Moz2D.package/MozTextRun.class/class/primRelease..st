private - ffi
primRelease: aHandle

	"Text run is not standard inlined pointer so we have to treat it differently"
	^ self ffiCall: #( void moz2d_text_run_release ( void* aHandle ) )