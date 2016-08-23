private - ffi
primSetPermitSubpixelAA: aBoolean

	^ self ffiCall: #(void moz2d_draw_target_set_permit_subpixel_aa (self, bool aBoolean))