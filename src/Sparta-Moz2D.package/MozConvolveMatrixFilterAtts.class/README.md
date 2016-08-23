enum ConvolveMatrixAtts
{
   ATT_CONVOLVE_MATRIX_KERNEL_SIZE = 0,         // IntSize
   ATT_CONVOLVE_MATRIX_KERNEL_MATRIX,            // Float[]
   ATT_CONVOLVE_MATRIX_DIVISOR,                     // Float
   ATT_CONVOLVE_MATRIX_BIAS,                         // Float
   ATT_CONVOLVE_MATRIX_TARGET,                      // IntPoint
   ATT_CONVOLVE_MATRIX_SOURCE_RECT,               // IntRect
   ATT_CONVOLVE_MATRIX_EDGE_MODE,                  // ConvolveMatrixEdgeMode
   ATT_CONVOLVE_MATRIX_KERNEL_UNIT_LENGTH,    // Size
   ATT_CONVOLVE_MATRIX_PRESERVE_ALPHA,          // bool
};