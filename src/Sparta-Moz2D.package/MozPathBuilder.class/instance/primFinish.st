private - ffi
primFinish

	^ self ffiCall: #(#MozPath moz2d_path_builder_finish ( self ) )