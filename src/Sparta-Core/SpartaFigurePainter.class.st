Class {
	#name : #SpartaFigurePainter,
	#superclass : #SpartaAbstractPainter,
	#traits : 'TSpartaStrokeOptions',
	#classTraits : 'TSpartaStrokeOptions classTrait',
	#instVars : [
		'path',
		'background',
		'border',
		'backgroundAlpha',
		'borderAlpha',
		'borderWidth',
		'strokeOptions',
		'borderPosition'
	],
	#classVars : [
		'BorderCentered',
		'BorderInside',
		'BorderOutside'
	],
	#category : #'Sparta-Core-Builders'
}

{ #category : #'class initialization' }
SpartaFigurePainter class >> initialize [
	BorderOutside := #Outside.
	BorderCentered := #Centered.
	BorderInside := #Inside
]

{ #category : #'api - painter' }
SpartaFigurePainter >> background: aSpartaPaint [
	background := aSpartaPaint asSpartaPaintOn: canvas
]

{ #category : #'api - painter' }
SpartaFigurePainter >> backgroundAlpha: aNumber [
	backgroundAlpha := aNumber
]

{ #category : #'api - painter' }
SpartaFigurePainter >> border: aSpartaPaint [
	border := aSpartaPaint asSpartaPaintOn: canvas
]

{ #category : #'api - painter' }
SpartaFigurePainter >> borderAlpha: aNumber [
	borderAlpha := aNumber
]

{ #category : #'api - painter' }
SpartaFigurePainter >> borderCentered [
	borderPosition := BorderCentered
]

{ #category : #'api - painter' }
SpartaFigurePainter >> borderInside [
	borderPosition := BorderInside
]

{ #category : #'api - painter' }
SpartaFigurePainter >> borderOutside [
	borderPosition := BorderOutside
]

{ #category : #'cap styles' }
SpartaFigurePainter >> capButt [
	self strokeOptions capButt
]

{ #category : #'cap styles' }
SpartaFigurePainter >> capRound [
	self strokeOptions capRound
]

{ #category : #'cap styles' }
SpartaFigurePainter >> capSquare [
	self strokeOptions capSquare
]

{ #category : #accessing }
SpartaFigurePainter >> dashOffset: aFloat [
	self strokeOptions dashOffset: aFloat
]

{ #category : #accessing }
SpartaFigurePainter >> dashPattern: anArrayOfFloats [
	self strokeOptions dashPattern: anArrayOfFloats
]

{ #category : #drawing }
SpartaFigurePainter >> draw [
	path spartaDrawFigureOn: canvas with: self
]

{ #category : #drawing }
SpartaFigurePainter >> drawCircle: aSpartaCircle [
	self drawGeometry: aSpartaCircle
]

{ #category : #drawing }
SpartaFigurePainter >> drawGeometry: aSpartaGeometry [
	| aFillGeometry aStrokeGeometry aHalfWidth |
	
	aFillGeometry := aStrokeGeometry := aSpartaGeometry.
	
	(borderWidth closeTo: 0)
		ifTrue: [
			canvas fill
				paint: background;
				path: aFillGeometry;
				alpha: backgroundAlpha;
				draw.
			^ self ].

	aHalfWidth := borderWidth / 2.0.
	
	self isBorderOutside
		ifTrue: [ aStrokeGeometry := aStrokeGeometry insetBy: aHalfWidth negated ].

	self isBorderCentered
		ifTrue: [ aFillGeometry := aFillGeometry insetBy: aHalfWidth ].
	
	self isBorderInside
		ifTrue: [		
			aFillGeometry := aFillGeometry insetBy: borderWidth.
			aStrokeGeometry := aStrokeGeometry insetBy: aHalfWidth ].

	canvas fill
		paint: background;
		path: aFillGeometry;
		alpha: backgroundAlpha;
		draw.
		
	canvas stroke
		"reuse my stroke options"
		in: [ :aStrokePainter | strokeOptions ifNotNil: [ aStrokePainter strokeOptions: strokeOptions ] ];
		paint: border;
		path: aStrokeGeometry;
		alpha: borderAlpha;
		width: borderWidth;
		draw
]

{ #category : #drawing }
SpartaFigurePainter >> drawLine: aSpartaLine [
	"Line can only be stroked with centered position, everything else does not make sense for it"
	
	canvas stroke
		"reuse my stroke options"
		in: [ :aStrokePainter | strokeOptions ifNotNil: [ aStrokePainter strokeOptions: strokeOptions ] ];
		paint: border;
		path: aSpartaLine;
		alpha: borderAlpha;
		width: borderWidth;
		draw
]

{ #category : #drawing }
SpartaFigurePainter >> drawPath: aSpartaPath [
	"I am a generic implementation of figure rendering when drawing a generic vector path.
	To achieve perfect overlapping of the background and border we have to render it on a new
	layer while using source composition operator to remove parts of the background or border
	depending on the border position"

	self isBorderOutside
		ifTrue: [ canvas stroke
				in: [ :aStrokePainter | strokeOptions ifNotNil: [ aStrokePainter strokeOptions: strokeOptions ] ];
				paint: border;
				path: aSpartaPath;
				alpha: borderAlpha;
				width: borderWidth * 2;
				composeOver;
				draw.	"draw background on top of the border removing parts of it"
			canvas fill
				paint: background;
				path: aSpartaPath;
				alpha: backgroundAlpha;
				composeSource;
				draw ].

	self isBorderCentered
		ifTrue: [ canvas fill
				paint: background;
				path: aSpartaPath;
				alpha: backgroundAlpha;
				composeOver;
				draw.

			canvas stroke
				in: [ :aStrokePainter | strokeOptions ifNotNil: [ aStrokePainter strokeOptions: strokeOptions ] ];
				paint: border;
				path: aSpartaPath;
				alpha: borderAlpha;
				width: borderWidth;
				composeOver;
				draw ].

	self isBorderInside
		ifTrue: [ canvas fill
				paint: background;
				path: aSpartaPath;
				alpha: backgroundAlpha;
				composeOver;
				draw.

			canvas clip
				by: aSpartaPath
				during: [ canvas stroke
						in: [ :aStrokePainter | strokeOptions ifNotNil: [ aStrokePainter strokeOptions: strokeOptions ] ];
						paint: border;
						path: aSpartaPath;
						alpha: borderAlpha;
						width: borderWidth * 2.0;
						composeOver;
						draw	"reuse my stroke options" ] ]
]

{ #category : #drawing }
SpartaFigurePainter >> drawRectangle: aRectangle [
	self drawGeometry: aRectangle
]

{ #category : #drawing }
SpartaFigurePainter >> drawRoundedRectangle: aSpartaRoundedRectangle [
	self drawGeometry: aSpartaRoundedRectangle
]

{ #category : #private }
SpartaFigurePainter >> isBorderCentered [
	^ borderPosition = BorderCentered
]

{ #category : #private }
SpartaFigurePainter >> isBorderInside [
	^ borderPosition = BorderInside
]

{ #category : #private }
SpartaFigurePainter >> isBorderOutside [
	^ borderPosition = BorderOutside
]

{ #category : #'join styles' }
SpartaFigurePainter >> joinBevel [
	self strokeOptions joinBevel
]

{ #category : #'join styles' }
SpartaFigurePainter >> joinMiter [
	self strokeOptions joinMiter
]

{ #category : #'join styles' }
SpartaFigurePainter >> joinMiterOrBevel [
	self strokeOptions joinMiterOrBevel
]

{ #category : #'join styles' }
SpartaFigurePainter >> joinRound [
	self strokeOptions joinRound
]

{ #category : #accessing }
SpartaFigurePainter >> miterLimit: aFloat [
	self strokeOptions miterLimit: aFloat
]

{ #category : #'api - painter' }
SpartaFigurePainter >> path: aSpartaPath [
	path := aSpartaPath asSpartaPathOn: canvas
]

{ #category : #'initialize-release' }
SpartaFigurePainter >> reset [
	super reset.
	
	background := Color transparent.
	border := Color transparent.
	backgroundAlpha := 1.
	borderAlpha := 1.
	borderPosition := BorderInside.
	borderWidth := self class defaultWidth
]

{ #category : #private }
SpartaFigurePainter >> strokeOptions [
	^ strokeOptions ifNil: [ strokeOptions := canvas strokeOptions ]
]

{ #category : #accessing }
SpartaFigurePainter >> width: aFloat [
	borderWidth := aFloat
]
