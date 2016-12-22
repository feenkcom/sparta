private
testCall
	^ self ffiCall: #(void* moz2d_color_create(1, 1, 1, 1))