private - ffi
primSetHintMetrics: aHintMetrics

	^ self ffiCall: #(void cairo_font_options_set_hint_metrics ( self, SpartaCairoHintMetrics aHintMetrics) )