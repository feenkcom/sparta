accessing
matrix: aSpartaMatrix
	| aCairoMatrix |
	
	aCairoMatrix := SpartaCairoMatrix fromSpartaMatrix: aSpartaMatrix.
	self primMatrix: aCairoMatrix