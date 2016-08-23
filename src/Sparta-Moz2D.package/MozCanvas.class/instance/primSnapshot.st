private - ffi
primSnapshot

	^ self ffiCall: #(SourceSurface moz2d_draw_target_snapshot ( self ) )