accessing
dashPattern: anArrayOfFloats
	| buffer |
	
	self privateDashLength: anArrayOfFloats size.
	
	anArrayOfFloats ifEmpty: [ ^ self ].

	buffer := FFIExternalArray externalNewType: 'float' size: anArrayOfFloats size.
	anArrayOfFloats withIndexDo: [ :dash :index |
		buffer at: index put: dash asFloat ].

	self privateDashPattern: buffer