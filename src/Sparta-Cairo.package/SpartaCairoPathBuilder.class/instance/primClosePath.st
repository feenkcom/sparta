private - ffi
primClosePath
	
	self ffiCall: #(void cairo_close_path ( SpartaCairoCanvas canvas ) )