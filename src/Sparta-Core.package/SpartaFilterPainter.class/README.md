! SpartaFilterPainter

I am an abstract filter painter used to construct filter drawing operation.

!! Overview

I am responsible for creation and execution of filter draw operation. It requires an area on which it should be applied, an offset (if not set, area origin is used instead) and actual filter primitive.

Developers should use me to create a filter drawing operation. It involves a configuration step of wanted filter and actual drawing step. I must be only created by canvas, and never directly refering my class.

!! Public API and Key Messages

- ==area:== - set an area on which filter should be applied (source area)
- ==type:== - an object representing one of filter primitives. See ==filters== protocol in *SpartaCanvas>../SpartaCanvas.class/README.md*
- ==to:== - ''(optional)'' set location on canvas where result should be blended (destination). If not set, area origin is used.
- ==drawOptions:== - ''(optional)'' set additional draw parameters, such as global alpha, composition operator and antialias.

!! Example:

[[[language=smalltalk
canvas filter
	area: (100@100 extent: 200@200);
	to: 150@150;
	type: (canvas gaussianBlurFilter
		source: canvas;
		stdDeviation: 4);
	draw.
]]]

!! Internal Representation and Key Implementation Points.

!!! Instance Variables
- destinationPoint:     ==<Point>==
- drawOptions:		==<TSpartaDrawOptions>==
- filter:		==<TSpartaFilter>==
- sourceRectangle:	==<Rectangle>==

!!! Implementation Points

I am an abstract class. Concrete backends must implement ==#draw==
