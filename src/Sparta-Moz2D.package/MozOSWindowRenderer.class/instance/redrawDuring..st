updating
redrawDuring: aBlock

	self lockSurface.
	[ aBlock value: spartaCanvas ] ensure: [ self unlockSurface ].
	window handle updateWindowSurface