private - ffi
primSnapshot

	^ self ffiCall: #(MozSurface moz2d_draw_target_snapshot ( self ) )