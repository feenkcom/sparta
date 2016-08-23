private - ffi - testing
primIsSubpixelAAPermitted

	^ self ffiCall: #(bool moz2d_draw_target_get_permit_subpixel_aa ( self ) )