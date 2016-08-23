updating
redrawDuring: aBlock
	self makeCurrent.
	"'----------' logCr."
	"context getHandle logCr.
	sdlSurface getHandle logCr.
	glContext getHandle logCr.
	skiaGlue getHandle logCr.
	spartaCanvas logCr."
	
	spartaCanvas fill
		paint: Color random;
		path: (0@0 extent: spartaCanvas extent);
		draw.
		
	self swapBuffers.