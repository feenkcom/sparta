accessing
stitchable: aBoolean
	"If stitchTiles='noStitch' (false), no attempt it made to achieve smooth transitions at the border of tiles which contain a turbulence function. Sometimes the result will show clear discontinuities at the tile borders.
	If stitchTiles='stitch' (true), then the user agent will automatically adjust baseFrequency-x and baseFrequency-y values such that the feTurbulence node's width and height (i.e., the width and height of the current subregion) contains an integral number of the Perlin tile width and height for the first octave. The baseFrequency will be adjusted up or down depending on which way has the smallest relative (not absolute) change as follows: Given the frequency, calculate lowFreq=floor(width*frequency)/width and hiFreq=ceil(width*frequency)/width. If frequency/lowFreq < hiFreq/frequency then use lowFreq, else use hiFreq. While generating turbulence values, generate lattice vectors as normal for Perlin Noise, except for those lattice points that lie on the right or bottom edges of the active area (the size of the resulting tile). In those cases, copy the lattice vector from the opposite edge of the active area.
	If attribute ‘stitchTiles’ is not specified, then the effect is as if a value of noStitch were specified."
	self
		primSetAttributeBool: aBoolean
		index: MozTurbulenceFilterAtts ATT_TURBULENCE_STITCHABLE