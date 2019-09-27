"
Turbulence filter primitive creates an image using the Perlin turbulence function. It allows the synthesis of artificial textures like clouds or marble. For a detailed description the of the Perlin turbulence function, see ""Texturing and Modeling"", Ebert et al, AP Professional, 1994. The resulting image will fill the entire filter primitive subregion for this filter primitive.

https://www.w3.org/TR/SVG/filters.html#feTurbulenceElement

It is possible to create bandwidth-limited noise by synthesizing only one octave.

For fractalSum, you get a turbFunctionResult that is aimed at a range of -1 to 1 (the actual result might exceed this range in some cases). To convert to a color value, use the formula colorValue = ((turbFunctionResult * 255) + 255) / 2, then clamp to the range 0 to 255.

For turbulence, you get a turbFunctionResult that is aimed at a range of 0 to 1 (the actual result might exceed this range in some cases). To convert to a color value, use the formula colorValue = (turbFunctionResult * 255), then clamp to the range 0 to 255.

The following order is used for applying the pseudo random numbers. An initial seed value is computed based on attribute ‘seed’. Then the implementation computes the lattice points for R, then continues getting additional pseudo random numbers relative to the last generated pseudo random number and computes the lattice points for G, and so on for B and A.

Public API and Key Messages

- area:  
- baseFrequence:
- numOctaves:
- seed:
- stitchable:
- typeFractalNoise
- typeTurbulence
"
Class {
	#name : #MozTurbulenceFilter,
	#superclass : #MozFilter,
	#traits : 'TSpartaTurbulenceFilter',
	#classTraits : 'TSpartaTurbulenceFilter classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozTurbulenceFilter class >> filterType [
	^ MozFilterType TURBULENCE
]

{ #category : #accessing }
MozTurbulenceFilter >> area: aRectangle [
	"Area to be filled with noise"
	self
		primSetAttributeIntRectX: aRectangle left rounded
		y: aRectangle top rounded
		width: aRectangle width rounded
		height: aRectangle height rounded
		index: MozTurbulenceFilterAtts ATT_TURBULENCE_RECT
]

{ #category : #accessing }
MozTurbulenceFilter >> baseFrequence: aPointOrFloat [
	"The base frequency (frequencies) parameter(s) for the noise function.
	If two <number>s are provided, the first number represents a base frequency in the X direction and the second value represents a base frequency in the Y direction. If one number is provided, then that value is used for both X and Y. A negative value for base frequency is an error.
	If the attribute is not specified, then the effect is as if a value of 0 were specified."

	self
		privateSetAttributeSize: aPointOrFloat
		index: MozTurbulenceFilterAtts ATT_TURBULENCE_BASE_FREQUENCY
]

{ #category : #accessing }
MozTurbulenceFilter >> fractalNoise [
	"Indicates whether the filter primitive should perform a noise or turbulence function.
	If attribute ‘type’ is not specified, then the effect is as if a value of turbulence were specified."
	self
		primSetAttributeEnum: MozTurbulenceFilterType TURBULENCE_TYPE_FRACTAL_NOISE
		index: MozTurbulenceFilterAtts ATT_TURBULENCE_TYPE
]

{ #category : #initialization }
MozTurbulenceFilter >> initialize [
	super initialize.
	
	self numOctaves: 1
]

{ #category : #accessing }
MozTurbulenceFilter >> numOctaves: aNumber [
	"The numOctaves parameter for the noise function.
	If the attribute is not specified, then the effect is as if a value of 1 were specified."
	self
		primSetAttributeInt: aNumber
		index: MozTurbulenceFilterAtts ATT_TURBULENCE_NUM_OCTAVES
]

{ #category : #accessing }
MozTurbulenceFilter >> seed: aNumber [
	"The starting number for the pseudo random number generator.
	If the attribute is not specified, then the effect is as if a value of 0 were specified. When the seed number is handed over to the 	algorithm above it must first be truncated, i.e. rounded to the closest integer value towards zero."
	self
		primSetAttributeInt: aNumber
		index: MozTurbulenceFilterAtts ATT_TURBULENCE_SEED
]

{ #category : #accessing }
MozTurbulenceFilter >> stitchable: aBoolean [
	"If stitchTiles='noStitch' (false), no attempt it made to achieve smooth transitions at the border of tiles which contain a turbulence function. Sometimes the result will show clear discontinuities at the tile borders.
	If stitchTiles='stitch' (true), then the user agent will automatically adjust baseFrequency-x and baseFrequency-y values such that the feTurbulence node's width and height (i.e., the width and height of the current subregion) contains an integral number of the Perlin tile width and height for the first octave. The baseFrequency will be adjusted up or down depending on which way has the smallest relative (not absolute) change as follows: Given the frequency, calculate lowFreq=floor(width*frequency)/width and hiFreq=ceil(width*frequency)/width. If frequency/lowFreq < hiFreq/frequency then use lowFreq, else use hiFreq. While generating turbulence values, generate lattice vectors as normal for Perlin Noise, except for those lattice points that lie on the right or bottom edges of the active area (the size of the resulting tile). In those cases, copy the lattice vector from the opposite edge of the active area.
	If attribute ‘stitchTiles’ is not specified, then the effect is as if a value of noStitch were specified."
	self
		primSetAttributeBool: aBoolean
		index: MozTurbulenceFilterAtts ATT_TURBULENCE_STITCHABLE
]

{ #category : #accessing }
MozTurbulenceFilter >> turbulence [
	"Indicates whether the filter primitive should perform a noise or turbulence function.
	If attribute ‘type’ is not specified, then the effect is as if a value of turbulence were specified."
	self
		primSetAttributeEnum: MozTurbulenceFilterType TURBULENCE_TYPE_TURBULENCE
		index: MozTurbulenceFilterAtts ATT_TURBULENCE_TYPE
]
