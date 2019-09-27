"
Gaussian blur filter primitive performs a Gaussian blur on the input image.

https://www.w3.org/TR/SVG/filters.html#feGaussianBlurElement

The Gaussian blur kernel is an approximation of the normalized convolution:

G(x,y) = H(x)I(y)

where

H(x) = exp(-x2/ (2s2)) / sqrt(2* pi*s2)

and

I(y) = exp(-y2/ (2t2)) / sqrt(2* pi*t2)

with 's' being the standard deviation in the x direction and 't' being the standard deviation in the y direction, as specified by ‘stdDeviation’.

The value of ‘stdDeviation’ can be either one or two numbers. If two numbers are provided, the first number represents a standard deviation value along the x-axis of the current coordinate system and the second value represents a standard deviation in Y. If one number is provided, then that value is used for both X and Y.

Even if only one value is provided for ‘stdDeviation’, this can be implemented as a separable convolution.

For larger values of 's' (s >= 2.0), an approximation can be used: Three successive box-blurs build a piece-wise quadratic convolution kernel, which approximates the Gaussian kernel to within roughly 3%.

let d = floor(s * 3*sqrt(2*pi)/4 + 0.5)

... if d is odd, use three box-blurs of size 'd', centered on the output pixel.

... if d is even, two box-blurs of size 'd' (the first one centered on the pixel boundary between the output pixel and the one to the left, the second one centered on the pixel boundary between the output pixel and the one to the right) and one box blur of size 'd+1' centered on the output pixel.

Note: the approximation formula also applies correspondingly to 't'.
"
Class {
	#name : #MozGaussianBlurFilter,
	#superclass : #MozSingleSourceFilter,
	#traits : 'TSpartaGaussianBlurFilter',
	#classTraits : 'TSpartaGaussianBlurFilter classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozGaussianBlurFilter class >> filterType [
	^ MozFilterType GAUSSIAN_BLUR
]

{ #category : #accessing }
MozGaussianBlurFilter >> stdDeviation: aFloat [
	"The standard deviation for the blur operation. If two <number>s are provided, the first number represents a standard deviation value along the x-axis of the coordinate system established by attribute ‘primitiveUnits’ on the ‘filter’ element. The second value represents a standard deviation in Y. If one number is provided, then that value is used for both X and Y.
	A negative value is an error. A value of zero disables the effect of the given filter primitive (i.e., the result is the filter input image). If ‘stdDeviation’ is 0 in only one of X or Y, then the effect is that the blur is only applied in the direction that has a non-zero value. 
	If the attribute is not specified, then the effect is as if a value of 0 were specified."
	self
		primSetAttributeFloat: aFloat
		index: MozGaussianBlurFilterAtts ATT_GAUSSIAN_BLUR_STD_DEVIATION
]
