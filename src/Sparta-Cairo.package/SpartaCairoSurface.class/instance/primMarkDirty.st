private - ffi
primMarkDirty
	
	^ self ffiCall: #(void cairo_surface_mark_dirty (self) )