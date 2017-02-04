private - ffi
primSetSubpixelOrder: aSubpixelOrder

	^ self ffiCall: #(void cairo_font_options_set_subpixel_order ( self, SpartaCairoSubpixelOrder aSubpixelOrder ) )