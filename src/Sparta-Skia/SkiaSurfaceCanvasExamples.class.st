Class {
	#name : #SkiaSurfaceCanvasExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #'examples - clip rectangle' }
SkiaSurfaceCanvasExamples >> clipRectangle [
	<gtExample>
	| aSurface aCanvas aRectangle |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aRectangle := SpartaRectangle fromRectangle: (10@10 corner: 60@40).
	
	aCanvas := aSurface canvas.
	aCanvas clipRectangle: aRectangle.
	
	self assert: aCanvas clipLocalBounds equals: (9@9 corner: 61@41).
	self assert: aCanvas clipDeviceBounds equals: (10@10 corner: 60@40).
	
	aCanvas drawPaint: (SkiaPaint new color: Color lightGray).
	
	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - draw circle' }
SkiaSurfaceCanvasExamples >> drawCircleWithGrayFill [
	<gtExample>
	| aSurface aCanvas aCircle aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aCircle := SpartaCircle center: 35@25 radius: 20.

	aPaint := SkiaPaint new
		antialias: true;
		color: Color lightGray;
		paintStyle: SkiaPaintStyle Fill.
	
	aCanvas := aSurface canvas.
	aCanvas drawCircle: aCircle paint: aPaint.
	
	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - draw color' }
SkiaSurfaceCanvasExamples >> drawColorBlack [
	<gtExample>
	| aSurface aCanvas thePixels |
	
	aSurface := SkiaSurfaceExamples new newRasterPremultipledSizeOne.
	
	aCanvas := aSurface canvas.
	aCanvas drawColor: Color black.
	aCanvas flush.
	aCanvas release.
	
	thePixels := aSurface data asArray.
	self assert: thePixels equals: #(0 0 0 255).
	
	^ aSurface
]

{ #category : #'examples - draw color' }
SkiaSurfaceCanvasExamples >> drawColorBlue [
	<gtExample>
	| aSurface aCanvas thePixels |
	
	aSurface := SkiaSurfaceExamples new newRasterPremultipledSizeOne.
	
	aCanvas := aSurface canvas.
	aCanvas drawColor: Color blue.
	aCanvas flush.
	aCanvas release.
	
	thePixels := aSurface data asArray.
	self assert: thePixels equals: #(0 0 255 255).
	
	^ aSurface
]

{ #category : #'examples - draw color' }
SkiaSurfaceCanvasExamples >> drawColorGreen [
	<gtExample>
	| aSurface aCanvas thePixels |
	
	aSurface := SkiaSurfaceExamples new newRasterPremultipledSizeOne.
	
	aCanvas := aSurface canvas.
	aCanvas drawColor: Color green.
	aCanvas flush.
	aCanvas release.
	
	thePixels := aSurface data asArray.
	self assert: thePixels equals: #(0 255 0 255).
	
	^ aSurface
]

{ #category : #'examples - draw color' }
SkiaSurfaceCanvasExamples >> drawColorRed [
	<gtExample>
	| aSurface aCanvas thePixels |
	
	aSurface := SkiaSurfaceExamples new newRasterPremultipledSizeOne.
	
	aCanvas := aSurface canvas.
	aCanvas drawColor: Color red.
	aCanvas flush.
	aCanvas release.
	
	thePixels := aSurface data asArray.
	self assert: thePixels equals: #(255 0 0 255).
	
	^ aSurface
]

{ #category : #'examples - draw color' }
SkiaSurfaceCanvasExamples >> drawColorTransparent [
	<gtExample>
	| aSurface aCanvas thePixels |
	
	aSurface := SkiaSurfaceExamples new newRasterPremultipledSizeOne.
	
	aCanvas := aSurface canvas.
	aCanvas drawColor: Color transparent.
	aCanvas flush.
	aCanvas release.
	
	thePixels := aSurface data asArray.
	self assert: thePixels equals: #(0 0 0 0).
	
	^ aSurface
]

{ #category : #'examples - draw color' }
SkiaSurfaceCanvasExamples >> drawColorWhite [
	<gtExample>
	| aSurface aCanvas thePixels |
	
	aSurface := SkiaSurfaceExamples new newRasterPremultipledSizeOne.
	
	aCanvas := aSurface canvas.
	aCanvas drawColor: Color white.
	aCanvas flush.
	aCanvas release.
	
	thePixels := aSurface data asArray.
	self assert: thePixels equals: #(255 255 255 255).
	
	^ aSurface
]

{ #category : #'examples - draw line' }
SkiaSurfaceCanvasExamples >> drawLineBlack [
	<gtExample>
	| aSurface aCanvas aLine aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 50@50.
	
	aLine := SpartaLine from: 10@10 to: 40@40.
	aPaint := SkiaPaint new
		color: Color black;
		strokeWidth: 6;
		paintStyle: SkiaPaintStyle StrokeAndFill.
	
	aCanvas := aSurface canvas.
	aCanvas drawLine: aLine paint: aPaint.
	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - draw line' }
SkiaSurfaceCanvasExamples >> drawLineBlackWithAntiAlias [
	<gtExample>
	| aSurface aCanvas aLine aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 50@50.
	
	aLine := SpartaLine from: 10@10 to: 40@40.
	aPaint := SkiaPaint new
		antialias: true;
		color: Color black;
		strokeWidth: 6;
		paintStyle: SkiaPaintStyle StrokeAndFill.
	
	aCanvas := aSurface canvas.
	aCanvas drawLine: aLine paint: aPaint.
	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - draw oval' }
SkiaSurfaceCanvasExamples >> drawOvalWithGrayFill [
	<gtExample>
	| aSurface aCanvas aRectangle aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aRectangle := SpartaRectangle fromRectangle: (10@10 corner: 60@40).

	aPaint := SkiaPaint new
		antialias: true;
		color: Color lightGray;
		paintStyle: SkiaPaintStyle Fill.
	
	aCanvas := aSurface canvas.
	aCanvas drawOval: aRectangle paint: aPaint.
	
	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - draw paint' }
SkiaSurfaceCanvasExamples >> drawPaintBlack [
	<gtExample>
	| aSurface aCanvas aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 50@50.
	
	aPaint := SkiaPaint new
		color: Color black;
		paintStyle: SkiaPaintStyle Fill.
	
	aCanvas := aSurface canvas.
	aCanvas drawPaint: aPaint.
	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - draw path' }
SkiaSurfaceCanvasExamples >> drawPathTriangleWithGrayFill [
	<gtExample>
	| aSurface aCanvas aPath aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aPath := SkiaPath new
		moveTo: 10@40;
		lineTo: 35@10;
		lineTo: 60@40;
		close.

	aPaint := SkiaPaint new
		antialias: true;
		color: Color lightGray;
		paintStyle: SkiaPaintStyle Fill.
	
	aCanvas := aSurface canvas.
	aCanvas drawPath: aPath paint: aPaint.
	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - draw point' }
SkiaSurfaceCanvasExamples >> drawPointBlack [
	<gtExample>
	| aSurface aCanvas aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 50@50.
	
	aPaint := SkiaPaint new
		color: Color black;
		paintStyle: SkiaPaintStyle Fill.
	
	aCanvas := aSurface canvas.
	aCanvas drawPoint: 25@25 paint: aPaint.
	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - draw rectangle' }
SkiaSurfaceCanvasExamples >> drawRectangleWithGrayFill [
	<gtExample>
	| aSurface aCanvas aRectangle aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aRectangle := SpartaRectangle fromRectangle: (10@10 corner: 60@40).

	aPaint := SkiaPaint new
		color: Color lightGray;
		paintStyle: SkiaPaintStyle Fill.
	
	aCanvas := aSurface canvas.
	aCanvas drawRectangle: aRectangle paint: aPaint.

	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - draw rectangle' }
SkiaSurfaceCanvasExamples >> drawRectangleWithGrayStroke [
	<gtExample>
	| aSurface aCanvas aRectangle aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aRectangle := SpartaRectangle fromRectangle: (10@10 corner: 60@40).

	aPaint := SkiaPaint new
		color: Color lightGray;
		strokeWidth: 7;
		paintStyle: SkiaPaintStyle Stroke.
	
	aCanvas := aSurface canvas.
	aCanvas drawRectangle: aRectangle paint: aPaint.
	
	"this one is to show the actual rectangle path"
	aPaint strokeWidth: 1; color: Color black.
	aCanvas drawRectangle: aRectangle paint: aPaint.
	
	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - draw rectangle' }
SkiaSurfaceCanvasExamples >> drawRectangleWithGrayStrokeAndFill [
	<gtExample>
	| aSurface aCanvas aRectangle aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aRectangle := SpartaRectangle fromRectangle: (10@10 corner: 60@40).

	aPaint := SkiaPaint new
		color: Color lightGray;
		strokeWidth: 7;
		paintStyle: SkiaPaintStyle StrokeAndFill.
	
	aCanvas := aSurface canvas.
	aCanvas drawRectangle: aRectangle paint: aPaint.
	
	"this one is to show the actual rectangle path"
	aPaint strokeWidth: 1; color: Color black; paintStyle: SkiaPaintStyle Stroke.
	aCanvas drawRectangle: aRectangle paint: aPaint.
	
	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - quick reject' }
SkiaSurfaceCanvasExamples >> quickAcceptRectangle [
	<gtExample>
	| aSurface aCanvas aRectangle |
	
	aSurface := SkiaSurface newRasterPremultipled: 50@50.
	
	aRectangle := SpartaRectangle fromRectangle: (10@10 corner: 20@20).
	
	aCanvas := aSurface canvas.
	aCanvas clipRectangle: aRectangle.
	
	self assert: aCanvas clipLocalBounds equals: (9@9 corner: 21@21).
	self assert: aCanvas clipDeviceBounds equals: (10@10 corner: 20@20).
	
	"this rectangle is partially inside of the clip area -> it is accepted"
	self assert: (aCanvas quickRejectRectangle: (15@15 corner: 40@40)) not.
	
	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - quick reject' }
SkiaSurfaceCanvasExamples >> quickRejectRectangle [
	<gtExample>
	| aSurface aCanvas aRectangle |
	
	aSurface := SkiaSurface newRasterPremultipled: 50@50.
	
	aRectangle := SpartaRectangle fromRectangle: (10@10 corner: 20@20).
	
	aCanvas := aSurface canvas.
	aCanvas clipRectangle: aRectangle.
	
	self assert: aCanvas clipLocalBounds equals: (9@9 corner: 21@21).
	self assert: aCanvas clipDeviceBounds equals: (10@10 corner: 20@20).
	
	"this rectangle is outside of the clip area -> it is rejected"
	self assert: (aCanvas quickRejectRectangle: (25@25 corner: 40@40)).
	
	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]
