"
1. SpartaPathPainter
I am a root builder class of operations involving path and paint. Two typical ones are fill or stroke.

1. # Overview


While building any paint-path related operations user must specify path and paint to use.

I am instantiated by canvas and used to build paint-path related drawing operations. Draw options are optional.

1. # Public API and Key Messages


- `paint:` - set a SpartaPaint or any other object implementing asSpartaPaintOn: as paint to perform operation with. Typically, basic Kernel related objects (e.g. Color or Form) or SpartaSurface and SpartaCanvas can be used directly as paints. Concrete backend implementations may optimize rendering depending on paint type.
- `path:` - set a SpartaPath or any other object implementing asSpartaPathOn: as path to to perform operation with. Typically, simple Kernel geometry objects (e.g. Rectangle) are polymoprhic with SpartaPath and can be used directly. Concrete backend implementation may do a dispatch to optimize rendering depending on path type.
- `drawOptions:` - set a custom draw options object to use while performing corresponding draw operation. Draw options define an alpha value [0 .. 1] to use, a composition operator or antialias mode.
 
1. # Internal Representation and Key Implementation Points.


1. ##Instance Variables

- drawOptions: `<TSpartaDrawOptions>`
- paint: `<TSpartaPaint>`
- path:	`<TSpartaPath>`


1. ## Implementation Points

 
   I am an abstract class and can not be used directly. See my subclasses for examples.


"
Class {
	#name : #SpartaPathPainter,
	#superclass : #SpartaAbstractPainter,
	#traits : 'TSpartaDrawOptions',
	#classTraits : 'TSpartaDrawOptions classTrait',
	#instVars : [
		'path',
		'paint',
		'drawOptions'
	],
	#category : #'Sparta-Core-Builders'
}

{ #category : #accessing }
SpartaPathPainter >> alpha: aFloat [
	
	"The default alpha value is 1.0 so if we set it alpha to 1.0 while draw options
	are not set we don't have to do anything"
	(drawOptions isNil and: [ (aFloat closeTo: 1.0) ])
		ifTrue: [ ^ self ].

	self drawOptions alpha: aFloat
]

{ #category : #'antialias modes' }
SpartaPathPainter >> antialiasDefault [
	self drawOptions antialiasDefault
]

{ #category : #'antialias modes' }
SpartaPathPainter >> antialiasGray [
	self drawOptions antialiasGray
]

{ #category : #'antialias modes' }
SpartaPathPainter >> antialiasNone [
	self drawOptions antialiasNone
]

{ #category : #'antialias modes' }
SpartaPathPainter >> antialiasSubpixel [
	self drawOptions antialiasSubpixel
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeAdd [
	self drawOptions composeAdd
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeAtop [
	self drawOptions composeAtop
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeClear [
	self drawOptions composeClear
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeColor [
	self drawOptions composeColor
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeColorBurn [
	self drawOptions composeColorBurn
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeColorDodge [
	self drawOptions composeColorDodge
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeDarken [
	self drawOptions composeDarken
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeDestAtop [
	self drawOptions composeDestAtop
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeDestIn [
	self drawOptions composeDestIn
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeDestOut [
	self drawOptions composeDestOut
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeDestOver [
	self drawOptions composeDestOver
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeDifference [
	self drawOptions composeDifference
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeExclusion [
	self drawOptions composeExclusion
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeHardLight [
	self drawOptions composeHardLight
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeHue [
	self drawOptions composeHue
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeIn [
	self drawOptions composeIn
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeLighten [
	self drawOptions composeLighten
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeLuminosity [
	self drawOptions composeLuminosity
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeMultiply [
	self drawOptions composeMultiply
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeOut [
	self drawOptions composeOut
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeOver [
	self drawOptions composeOver
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeOverlay [
	self drawOptions composeOverlay
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeSaturation [
	self drawOptions composeSaturation
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeScreen [
	self drawOptions composeScreen
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeSoftLight [
	self drawOptions composeSoftLight
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeSource [
	self drawOptions composeSource
]

{ #category : #'composition operators' }
SpartaPathPainter >> composeXor [
	self drawOptions composeXor
]

{ #category : #accessing }
SpartaPathPainter >> drawOptions [
	^ drawOptions ifNil: [ drawOptions := canvas drawOptions ]
]

{ #category : #accessing }
SpartaPathPainter >> drawOptions: aDrawOptions [
	drawOptions := aDrawOptions
]

{ #category : #'private - accessing' }
SpartaPathPainter >> ensuredDrawOptions [
	^ drawOptions ifNil: [ canvas defaultDrawOptions ]
]

{ #category : #accessing }
SpartaPathPainter >> paint: aPaint [
	paint := aPaint asSpartaPaintOn: canvas
]

{ #category : #accessing }
SpartaPathPainter >> path: aPath [
	path := aPath asSpartaPathOn: canvas
]

{ #category : #'initialize-release' }
SpartaPathPainter >> reset [
	super reset.

	drawOptions := nil.
	paint := nil.
	path := nil
]
