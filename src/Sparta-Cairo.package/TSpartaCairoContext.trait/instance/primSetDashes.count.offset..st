private - ffi
primSetDashes: anArrayOfDoubles count: aNumberOfDashes offset: anOffset

	^ self ffiCall: #( void cairo_set_dash (
		SpartaCairoCanvas canvas,
      double* anArrayOfDoubles,
		int aNumberOfDashes,
		double anOffset ) )