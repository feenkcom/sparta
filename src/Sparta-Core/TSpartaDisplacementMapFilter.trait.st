"
DisplacementMap filter primitive uses the pixels values from the image from ‘secondSource’ to spatially displace the image from ‘source’. This is the transformation to be performed:

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
Trait {
	#name : #TSpartaDisplacementMapFilter,
	#category : #'Sparta-Core-Filters'
}

{ #category : #accessing }
TSpartaDisplacementMapFilter >> scale: aFloat [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaDisplacementMapFilter >> xChannelAlpha [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaDisplacementMapFilter >> xChannelBlue [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaDisplacementMapFilter >> xChannelGreen [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaDisplacementMapFilter >> xChannelRed [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaDisplacementMapFilter >> yChannelAlpha [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaDisplacementMapFilter >> yChannelBlue [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaDisplacementMapFilter >> yChannelGreen [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaDisplacementMapFilter >> yChannelRed [
	^ self explicitRequirement
]
