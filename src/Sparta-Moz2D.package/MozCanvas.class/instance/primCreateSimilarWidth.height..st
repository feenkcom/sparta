private - ffi
primCreateSimilarWidth: aWidth height: aHeight

	^ self ffiCall: #(MozCanvas moz2d_draw_target_create_similar( self, int32 aWidth, int32 aHeight ))