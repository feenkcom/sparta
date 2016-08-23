private - ffi - accessing
primGetDrawTargetType

	^ self ffiCall: #(MozDrawTargetType moz2d_draw_target_get_type ( self ) )