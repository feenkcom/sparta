private - ffi
primCurrentPoint: aReceiverPoint

	^ self ffiCall: #(void moz2d_path_sink_current_point( self, MozNativePoint aReceiverPoint ))