private - ffi
primPixelX: x y: y

	^ self ffiCall: #(uint32 moz2d_draw_target_get_pixel (self, int32 x, int32 y))