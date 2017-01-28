accessing
current
	| aSpartaMatrix aCairoMatrix |

	aCairoMatrix := SpartaCairoMatrix new.
	self primGetTransform: aCairoMatrix.
	aSpartaMatrix := SpartaMatrix new
		x: aCairoMatrix x;
		y: aCairoMatrix y;
		sx: aCairoMatrix sx;
		sy: aCairoMatrix sy;
		shx: aCairoMatrix shx;
		shy: aCairoMatrix shy.
		
	^ aSpartaMatrix