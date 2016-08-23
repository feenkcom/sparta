private - ffi
primExternalGradientStops: stops
	|array|
	array := ByteArray new: FFIFloat32 externalTypeSize * stops size * 5.
	
	stops withIndexDo: [ :assoc :i |
		| color offset index |
		index := (i - 1) * 5 * FFIFloat32 externalTypeSize.
		offset := assoc key.
		color := assoc value.
		array floatAt: (index + 1) put: offset.
		array floatAt: (index + 1) + FFIFloat32 externalTypeSize put: color red.
		array floatAt: (index + 1) + (2 * FFIFloat32 externalTypeSize) put: color green.
		array floatAt: (index + 1) + (3 * FFIFloat32 externalTypeSize) put: color blue.
		array floatAt: (index + 1) + (4 * FFIFloat32 externalTypeSize) put: color alpha ].
	^ array