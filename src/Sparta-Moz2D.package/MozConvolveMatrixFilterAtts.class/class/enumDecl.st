enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		ATT_CONVOLVE_MATRIX_KERNEL_SIZE 0      		"IntSize"
		ATT_CONVOLVE_MATRIX_KERNEL_MATRIX 1        "Float[]"
		ATT_CONVOLVE_MATRIX_DIVISOR 2              "Float"
		ATT_CONVOLVE_MATRIX_BIAS 3                 "Float"
		ATT_CONVOLVE_MATRIX_TARGET 4               "IntPoint"
		ATT_CONVOLVE_MATRIX_SOURCE_RECT 5          "IntRect"
		ATT_CONVOLVE_MATRIX_EDGE_MODE 6            "ConvolveMatrixEdgeMode"
		ATT_CONVOLVE_MATRIX_KERNEL_UNIT_LENGTH 7   "Size"
		ATT_CONVOLVE_MATRIX_PRESERVE_ALPHA 8       "bool"
	)