"
ConvolveMatrix applies a matrix convolution filter effect. A convolution combines pixels in the input image with neighboring pixels to produce a resulting image. A wide variety of imaging operations can be achieved through convolutions, including blurring, edge detection, sharpening, embossing and beveling.

https://www.w3.org/TR/SVG/filters.html#feConvolveMatrixElement

A matrix convolution is based on an n-by-m matrix (the convolution kernel) which describes how a given pixel value in the input image is combined with its neighboring pixel values to produce a resulting pixel value. Each result pixel is determined by applying the kernel matrix to the corresponding source pixel and its neighboring pixels. The basic convolution formula which is applied to each color value for a given pixel is:

COLORX,Y = ( 
              SUM I=0 to [orderY-1] { 
                SUM J=0 to [orderX-1] { 
                  SOURCE X-targetX+J, Y-targetY+I *  kernelMatrixorderX-J-1,  orderY-I-1 
                } 
              } 
            ) /  divisor +  bias * ALPHAX,Y 
where ""orderX"" and ""orderY"" represent the X and Y values for the ‘order’ attribute, ""targetX"" represents the value of the ‘targetX’ attribute, ""targetY"" represents the value of the ‘targetY’ attribute, ""kernelMatrix"" represents the value of the ‘kernelMatrix’ attribute, ""divisor"" represents the value of the ‘divisor’ attribute, and ""bias"" represents the value of the ‘bias’ attribute.

Note in the above formulas that the values in the kernel matrix are applied such that the kernel matrix is rotated 180 degrees relative to the source and destination images in order to match convolution theory as described in many computer graphics textbooks.

To illustrate, suppose you have a input image which is 5 pixels by 5 pixels, whose color values for one of the color channels are as follows:

    0  20  40 235 235
  100 120 140 235 235
  200 220 240 235 235
  225 225 255 255 255
  225 225 255 255 255
and you define a 3-by-3 convolution kernel as follows:

  1 2 3
  4 5 6
  7 8 9
Let's focus on the color value at the second row and second column of the image (source pixel value is 120). Assuming the simplest case (where the input image's pixel grid aligns perfectly with the kernel's pixel grid) and assuming default values for attributes ‘divisor’, ‘targetX’ and ‘targetY’, then resulting color value will be:

(9*  0 + 8* 20 + 7* 40 +
6*100 + 5*120 + 4*140 +
3*200 + 2*220 + 1*240) / (9+8+7+6+5+4+3+2+1)
Because they operate on pixels, matrix convolutions are inherently resolution-dependent. To make ‘feConvolveMatrix’ produce resolution-independent results, an explicit value should be provided for either the ‘filterRes’ attribute on the ‘filter’ element and/or attribute ‘kernelUnitLength’.

‘kernelUnitLength’, in combination with the other attributes, defines an implicit pixel grid in the filter effects coordinate system (i.e., the coordinate system established by the ‘primitiveUnits’ attribute). If the pixel grid established by ‘kernelUnitLength’ is not scaled to match the pixel grid established by attribute ‘filterRes’ (implicitly or explicitly), then the input image will be temporarily rescaled to match its pixels with ‘kernelUnitLength’. The convolution happens on the resampled image. After applying the convolution, the image is resampled back to the original resolution.

When the image must be resampled to match the coordinate system defined by ‘kernelUnitLength’ prior to convolution, or resampled to match the device coordinate system after convolution, it is recommended that high quality viewers make use of appropriate interpolation techniques, for example bilinear or bicubic. Depending on the speed of the available interpolents, this choice may be affected by the ‘image-rendering’ property setting. Note that implementations might choose approaches that minimize or eliminate resampling when not necessary to produce proper results, such as when the document is zoomed out such that ‘kernelUnitLength’ is considerably smaller than a device pixel.
"
Trait {
	#name : #TSpartaConvolveMatrixFilter,
	#category : 'Sparta-Core-Filters'
}

{ #category : #accessing }
TSpartaConvolveMatrixFilter >> area: aRectangle [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaConvolveMatrixFilter >> bias: aFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaConvolveMatrixFilter >> divisor: aFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaConvolveMatrixFilter >> edgeDuplicate [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaConvolveMatrixFilter >> edgeNone [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaConvolveMatrixFilter >> edgeWrap [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaConvolveMatrixFilter >> kernelUnitLength: aPointOrFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaConvolveMatrixFilter >> matrix: anArrayOfFloats [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaConvolveMatrixFilter >> order: aPointOrInteger [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaConvolveMatrixFilter >> preserveAlpha: aBoolean [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaConvolveMatrixFilter >> target: aPointOrInteger [
	^ self explicitRequirement
]
