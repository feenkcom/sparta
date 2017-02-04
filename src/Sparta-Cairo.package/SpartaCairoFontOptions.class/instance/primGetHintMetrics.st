private - ffi
primGetHintMetrics

	^ self ffiCall: #(SpartaCairoHintMetrics cairo_font_options_get_hint_metrics ( self ) )