private - ffi
primCreatePathBuilder
	^ self ffiCall: #(#MozPathBuilder moz2d_draw_target_create_path_builder(self, FILL_RULE_WINDING))