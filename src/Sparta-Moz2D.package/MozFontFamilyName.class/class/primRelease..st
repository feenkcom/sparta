private - ffi
primRelease: aHandle
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	^ self ffiCall: #(void moz2d_font_family_name_delete (void* aHandle))