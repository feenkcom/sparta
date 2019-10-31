"
This filter primitive uses the pixels values from the image from ‘secondSource’ to spatially displace the image from ‘source’. This is the transformation to be performed:

https://www.w3.org/TR/SVG/filters.html#feDisplacementMapElement

P'(x,y) <- P( x + scale * (XC(x,y) - .5), y + scale * (YC(x,y) - .5))
where P(x,y) is the input image, ‘source’, and P'(x,y) is the destination. XC(x,y) and YC(x,y) are the component values of the channel designated by the xChannelSelector and yChannelSelector. For example, to use the R component of ‘secondSource’ to control displacement in x and the G component of Image2 to control displacement in y, set xChannelSelector to ""R"" and yChannelSelector to ""G"".

The displacement map defines the inverse of the mapping performed.

The input image in is to remain premultiplied for this filter primitive. The calculations using the pixel values from ‘secondSource’ are performed using non-premultiplied color values. If the image from ‘secondSource’ consists of premultiplied color values, those values are automatically converted into non-premultiplied color values before performing this operation.

This filter can have arbitrary non-localized effect on the input which might require substantial buffering in the processing pipeline. However with this formulation, any intermediate buffering needs can be determined by scale which represents the maximum range of displacement in either x or y.

Public API and Key Messages

- scale:
- xChannel*
- yChannel*
"
Class {
	#name : #MozDisplacementMapFilter,
	#superclass : #MozDoubleSourceFilter,
	#traits : 'TSpartaDisplacementMapFilter',
	#classTraits : 'TSpartaDisplacementMapFilter classTrait',
	#category : 'Sparta-Moz2D-Filters'
}

{ #category : #accessing }
MozDisplacementMapFilter class >> filterType [
	^ MozFilterType DISPLACEMENT_MAP
]

{ #category : #initialization }
MozDisplacementMapFilter >> initialize [
	super initialize.
	
	self xChannelAlpha.
	self yChannelAlpha
]

{ #category : #accessing }
MozDisplacementMapFilter >> scale: aFloat [
	"Displacement scale factor. The amount is expressed in the coordinate system established by attribute ‘primitiveUnits’ on the ‘filter’ element.
	When the value of this attribute is 0, this operation has no effect on the source image.
	If the attribute is not specified, then the effect is as if a value of 0 were specified."
	self
		primSetAttributeFloat: aFloat
		index: MozDisplacementMapFilterAtts ATT_DISPLACEMENT_MAP_SCALE
]

{ #category : #accessing }
MozDisplacementMapFilter >> xChannelAlpha [
	"Indicates which channel from ‘secondSource’ to use to displace the pixels in ‘source’ along the x-axis.
	If attribute ‘xChannel*’ is not specified, then the effect is as if a value of A were specified. "
	self
		primSetAttributeEnum: MozDisplacementMapFilterColorChannel COLOR_CHANNEL_A
		index: MozDisplacementMapFilterAtts ATT_DISPLACEMENT_MAP_X_CHANNEL
]

{ #category : #accessing }
MozDisplacementMapFilter >> xChannelBlue [
	"Indicates which channel from ‘secondSource’ to use to displace the pixels in ‘source’ along the x-axis.
	If attribute ‘xChannel*’ is not specified, then the effect is as if a value of A were specified. "
	self
		primSetAttributeEnum: MozDisplacementMapFilterColorChannel COLOR_CHANNEL_B
		index: MozDisplacementMapFilterAtts ATT_DISPLACEMENT_MAP_X_CHANNEL
]

{ #category : #accessing }
MozDisplacementMapFilter >> xChannelGreen [
	"Indicates which channel from ‘secondSource’ to use to displace the pixels in ‘source’ along the x-axis.
	If attribute ‘xChannel*’ is not specified, then the effect is as if a value of A were specified. "
	self
		primSetAttributeEnum: MozDisplacementMapFilterColorChannel COLOR_CHANNEL_G
		index: MozDisplacementMapFilterAtts ATT_DISPLACEMENT_MAP_X_CHANNEL
]

{ #category : #accessing }
MozDisplacementMapFilter >> xChannelRed [
	"Indicates which channel from ‘secondSource’ to use to displace the pixels in ‘source’ along the x-axis.
	If attribute ‘xChannel*’ is not specified, then the effect is as if a value of A were specified. "
	self
		primSetAttributeEnum: MozDisplacementMapFilterColorChannel COLOR_CHANNEL_R
		index: MozDisplacementMapFilterAtts ATT_DISPLACEMENT_MAP_X_CHANNEL
]

{ #category : #accessing }
MozDisplacementMapFilter >> yChannelAlpha [
	"Indicates which channel from ‘secondSource’ to use to displace the pixels in ‘source’ along the y-axis.
	If attribute ‘yChannel*’ is not specified, then the effect is as if a value of A were specified. "
	self
		primSetAttributeEnum: MozDisplacementMapFilterColorChannel COLOR_CHANNEL_A
		index: MozDisplacementMapFilterAtts ATT_DISPLACEMENT_MAP_Y_CHANNEL
]

{ #category : #accessing }
MozDisplacementMapFilter >> yChannelBlue [
	"Indicates which channel from ‘secondSource’ to use to displace the pixels in ‘source’ along the y-axis.
	If attribute ‘yChannel*’ is not specified, then the effect is as if a value of A were specified. "
	self
		primSetAttributeEnum: MozDisplacementMapFilterColorChannel COLOR_CHANNEL_B
		index: MozDisplacementMapFilterAtts ATT_DISPLACEMENT_MAP_Y_CHANNEL
]

{ #category : #accessing }
MozDisplacementMapFilter >> yChannelGreen [
	"Indicates which channel from ‘secondSource’ to use to displace the pixels in ‘source’ along the y-axis.
	If attribute ‘yChannel*’ is not specified, then the effect is as if a value of A were specified. "
	self
		primSetAttributeEnum: MozDisplacementMapFilterColorChannel COLOR_CHANNEL_G
		index: MozDisplacementMapFilterAtts ATT_DISPLACEMENT_MAP_Y_CHANNEL
]

{ #category : #accessing }
MozDisplacementMapFilter >> yChannelRed [
	"Indicates which channel from ‘secondSource’ to use to displace the pixels in ‘source’ along the y-axis.
	If attribute ‘yChannel*’ is not specified, then the effect is as if a value of A were specified. "
	self
		primSetAttributeEnum: MozDisplacementMapFilterColorChannel COLOR_CHANNEL_R
		index: MozDisplacementMapFilterAtts ATT_DISPLACEMENT_MAP_Y_CHANNEL
]
