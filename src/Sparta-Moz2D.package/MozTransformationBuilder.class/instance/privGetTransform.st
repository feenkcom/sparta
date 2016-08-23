private
privGetTransform
	|externalArray|
	externalArray := FFIExternalArray externalNewType: 'float' size: 6.
	self primGetTransform: externalArray getHandle.
	^ SpartaMatrix fromExternalArray: externalArray