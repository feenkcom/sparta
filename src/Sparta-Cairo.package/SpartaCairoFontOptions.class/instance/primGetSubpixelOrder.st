private - ffi
primGetSubpixelOrder

	^ self ffiCall: #(SpartaCairoSubpixelOrder cairo_font_options_get_subpixel_order ( self ) )