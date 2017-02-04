testing
is32Bit
	"Return true if text run is build only from characters that may be represented
	by 1-4 glyphs (or take 8/16/32 bits in the memory), false otherwise"
	<return: #Boolean>

	^ self bits = 32