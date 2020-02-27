"
I am a wapper around SpartaCanvas providing Morphic Canvas api
"
Class {
	#name : #SpartaWrapperCanvas,
	#superclass : #Canvas,
	#instVars : [
		'canvas',
		'formCanvas'
	],
	#category : #'Sparta-Wrapper'
}

{ #category : #'instance creation' }
SpartaWrapperCanvas class >> on: aSpartaCanvas [
	^ self new canvas: aSpartaCanvas
]

{ #category : #initialization }
SpartaWrapperCanvas >> allocateForm: extentPoint [
	^ Form extent: extentPoint depth: 32
]

{ #category : #'Morphic-Base-Balloon' }
SpartaWrapperCanvas >> balloonFillRectangle: aRectangle fillStyle: aFillStyle [
	self canvas fill
		path: aRectangle;
		paint: aFillStyle;
		draw
]

{ #category : #accessing }
SpartaWrapperCanvas >> canvas [
	<return: #SpartaCanvas>

	^ canvas
]

{ #category : #accessing }
SpartaWrapperCanvas >> canvas: aSpartaCanvas [
	canvas := aSpartaCanvas
]

{ #category : #'drawing-support' }
SpartaWrapperCanvas >> clipBy: aRectangle during: aBlock [
	"Set a clipping rectangle active only during the execution of aBlock.
	Note: In the future we may want to have more general clip shapes - not just rectangles"
	
	self canvas clip
		by: aRectangle
		during: [ aBlock cull: self ]
]

{ #category : #accessing }
SpartaWrapperCanvas >> clipRect [
	"Return the currently active clipping rectangle"
	^ self canvas clip localBounds
]

{ #category : #accessing }
SpartaWrapperCanvas >> contentsOfArea: aRectangle into: aForm [
	"Return the contents of the given area"
	| bb |
	
	formCanvas ifNotNil: [ ^ formCanvas contentsOfArea: aRectangle into: aForm ].
	
	self canvas flush.
	bb := BitBlt toForm: aForm.
	bb
		sourceForm: self canvas asForm;
		combinationRule: Form over;
		sourceX: aRectangle left + self origin x;
		sourceY: aRectangle top + self origin y;
		width: aRectangle width;
		height: aRectangle height;
		copyBits.
	^ aForm
]

{ #category : #copying }
SpartaWrapperCanvas >> copyOffset: aPoint clipRect: sourceClip [
	^ self
]

{ #category : #'drawing-polygons' }
SpartaWrapperCanvas >> drawPolygon: vertices color: aColor borderWidth: bw borderColor: bc [
	| aPath |
	
	vertices
		ifEmpty: [ ^ self ].
	
	(aColor isTransparent and: [ bw isZero or: [ bc isTransparent ] ])
		ifTrue: [ ^ self ].
	
	aPath := self canvas shape polygon: vertices.
	
	aColor isTransparent
		ifFalse: [ 
			self canvas fill
				path: aPath;
				paint: aColor;
				draw ].

	(bw isZero or: [ bc isTransparent ])
		ifFalse: [ 
			self canvas stroke
				path: aPath;
				paint: bc;
				width: bw;
				draw ]
]

{ #category : #'drawing-text' }
SpartaWrapperCanvas >> drawString: s from: firstIndex to: lastIndex in: boundsRect font: fontOrNil color: c [
	| aLogicalFont aFont aString |
	
	aLogicalFont := fontOrNil ifNil: [ StandardFonts defaultFont ].
		
	aFont := self canvas font
		logical: aLogicalFont;
		build.	
			
	aString := s asString.
	aString := (firstIndex = 1 and: [ lastIndex = aString size ])
		ifTrue: [ aString ]
		ifFalse: [  aString := aString copyFrom: firstIndex to: lastIndex ].

	self canvas text
		font: aFont;
		string: aString;
		paint: c;
		baseline: (boundsRect origin asFloatPoint + (0@aLogicalFont ascent));
		draw
]

{ #category : #'drawing-text' }
SpartaWrapperCanvas >> drawString: s from: firstIndex to: lastIndex in: boundsRect font: fontOrNil color: c underline: underline underlineColor: uc strikethrough: strikethrough strikethroughColor: sc [
	self drawString: s from: firstIndex to: lastIndex in: boundsRect font: fontOrNil color: c
]

{ #category : #drawing }
SpartaWrapperCanvas >> encryptedParagraph: para bounds: bounds color: c [
	"Draw the given paragraph"

]

{ #category : #accessing }
SpartaWrapperCanvas >> extent [
	"Return the physical extent of the output device"
	^ self canvas extent
]

{ #category : #'drawing-ovals' }
SpartaWrapperCanvas >> fillOval: r color: c borderWidth: borderWidth borderColor: borderColor [
	"Fill the given oval."
	
	c isTransparent ifFalse: [ 
		self canvas fill
			paint: c;
			path: (self canvas shape ellipse: r);
			draw ].

	(borderWidth isZero or: [ borderColor isTransparent ])
		ifFalse: [
			self canvas stroke
				paint: borderColor;
				path: (self canvas shape ellipse: r);
				width: borderWidth;
				draw ]
]

{ #category : #initialization }
SpartaWrapperCanvas >> flush [
	super flush.
	
	formCanvas flush.
	canvas flush
]

{ #category : #accessing }
SpartaWrapperCanvas >> formCanvas [
	^ formCanvas
]

{ #category : #accessing }
SpartaWrapperCanvas >> formCanvas: aFormCanvas [
	formCanvas := aFormCanvas
]

{ #category : #'drawing-rectangles' }
SpartaWrapperCanvas >> frameAndFillRectangle: r fillColor: fillColor borderWidth: borderWidth borderColor: borderColor [
	"Draw the rectangle using the given attributes"
	
	fillColor isTransparent ifFalse: [ 
		self canvas fill
			paint: fillColor;
			path: r;
			draw ].

	(borderWidth isZero or: [ borderColor isTransparent ])
		ifFalse: [
			self canvas stroke
				paint: borderColor;
				path: r;
				width: borderWidth;
				draw ]
]

{ #category : #private }
SpartaWrapperCanvas >> image: aForm at: aPoint sourceRect: sourceRect rule: rule [
	"Note: The public use of this protocol is deprecated. It will become private. Nobody in the outside world must assume that a thing like a combination rule has any specific effect."
	| aSourceForm |
	
	aSourceForm := (sourceRect = (0 @ 0 extent: aForm extent))
		ifTrue: [ aForm ]
		ifFalse: [ aForm copy: sourceRect ].
	
	self canvas transform
		by: [ :t | t translateBy: aPoint ]
		during: [
			self canvas fill
				path: (0@0 extent: aSourceForm extent);
				paint: aSourceForm;
				draw ]
]

{ #category : #private }
SpartaWrapperCanvas >> line: pt1 to: pt2 width: w color: c [
	"Draw a line using the given width and color"
	
	self canvas stroke
		path: (self canvas shape line: pt1 to: pt2);
		paint: c;
		width: w;
		draw
]

{ #category : #accessing }
SpartaWrapperCanvas >> origin [
	"Return the current origin for drawing operations"
	
	^ self canvas transform current transform: 0@0
]

{ #category : #drawing }
SpartaWrapperCanvas >> paragraph: paragraph bounds: bounds color: c [
	paragraph drawOnWrapperCanvas: self bounds: bounds color: c
]

{ #category : #drawing }
SpartaWrapperCanvas >> rubParagraph: paragraph bounds: bounds color: c [
	self paragraph: paragraph bounds: bounds color: c
]

{ #category : #accessing }
SpartaWrapperCanvas >> showAt: pt invalidRects: updateRects [
]

{ #category : #'drawing-images' }
SpartaWrapperCanvas >> stencil: stencilForm at: aPoint sourceRect: sourceRect color: aColor [
	"Flood this canvas with aColor wherever stencilForm has non-zero pixels"
]

{ #category : #'drawing-support' }
SpartaWrapperCanvas >> transformBy: aDisplayTransform clippingTo: aClipRect during: aBlock smoothing: cellSize [
	"Transform the receiver by the given display transformation during the execution of aBlock. The given clip rectangle defines the *global* (e.g., outer) rectangle against which the receiver should clip (which would be equivalent to 'self clipRect: aClipRect; transformBy: aDisplayTransform')."
	| spartaMatrix |
	
	spartaMatrix := SpartaMatrix new.
	"spartaMatrix sx: aMatrix a11.
	spartaMatrix sy: aMatrix a22.
	
	spartaMatrix shy: aMatrix a12.
	spartaMatrix shx: aMatrix a21."
	
	spartaMatrix x: aDisplayTransform offset x negated.
	spartaMatrix y: aDisplayTransform offset y negated.

	self
		clipBy: aClipRect
		during: [
			self canvas transform
				by: [ :t | t multiplyBy: spartaMatrix ]
				during: [ aBlock cull: self ] ]
]

{ #category : #'drawing-support' }
SpartaWrapperCanvas >> translateBy: delta during: aBlock [
	"Set a translation only during the execution of aBlock."
	
	self canvas transform
		by: [ :t | t translateBy: delta ]
		during: [ aBlock value: self ]
]
