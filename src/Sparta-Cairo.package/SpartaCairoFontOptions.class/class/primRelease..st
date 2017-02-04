finalization
primRelease: aHandle

	"Plain pointers must be deleted using specific destroy*() methods, all users must implement a specific method"
	^ self ffiCall: #(void cairo_font_options_destroy ( void* aHandle) )