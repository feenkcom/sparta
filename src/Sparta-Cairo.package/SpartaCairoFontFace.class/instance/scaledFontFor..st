instance creation
scaledFontFor: aUserToDeviceMatrix
	| aFontMatrix theOptions |
	
	aFontMatrix := SpartaMatrix scale: self pointSize.
	theOptions := SpartaCairoFontOptions new
		antialias: SpartaCairoAntialias CAIRO_ANTIALIAS_SUBPIXEL;
		hintMetrics: SpartaCairoHintMetrics CAIRO_HINT_METRICS_ON;
		hintStyle: SpartaCairoHintStyle CAIRO_HINT_STYLE_MEDIUM;
		subpixelOrder: SpartaCairoSubpixelOrder CAIRO_SUBPIXEL_ORDER_RGB.
		
	^ SpartaCairoScaledFont create: self fontMatrix: aFontMatrix userToDeviceMatrix: aUserToDeviceMatrix options: theOptions