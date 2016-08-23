accessing
matrix: anArrayOfFloats
	"Matrix must be 5x4

	#(a[1] a[6]  a[11] a[16]
	  a[2] a[7]  a[12] a[17]
	  a[3] a[8]  a[13] a[18]
	  a[4] a[9]  a[14] a[19]
	  a[5] a[10] a[15] a[20])
	"
	
	self
		privateSetAttributeMatrix5x4: anArrayOfFloats
		index: MozColorMatrixFilterAtts ATT_COLOR_MATRIX_MATRIX
