private - ffi
primCreatePathBuilder: aMozFillRule
	^ self ffiCall: #(#MozPathBuilder moz2d_draw_target_create_path_builder(self, MozFillRule aMozFillRule))