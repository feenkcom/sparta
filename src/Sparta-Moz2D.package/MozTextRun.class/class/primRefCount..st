private - ffi
primRefCount: aHandle

	"Text run is not standard inlined pointer so we have to treat it differently"
	^ self ffiCall: #(ulong moz2d_text_run_ref_count (void* aHandle))