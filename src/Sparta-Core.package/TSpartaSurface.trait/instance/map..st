mapping
map: aBlock

	[ | thePixels |
		thePixels := self map.
		aBlock value: thePixels
	] ensure: [ self unmap ]