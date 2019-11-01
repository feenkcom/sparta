Class {
	#name : #SkiaSurfaceCanvasExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

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
		antiAlias: true;
		color: Color black;
		strokeWidth: 6;
		paintStyle: SkiaPaintStyle StrokeAndFill.
	
	aCanvas := aSurface canvas.
	aCanvas drawLine: aLine paint: aPaint.
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

{ #category : #'examples - draw rectangle' }
SkiaSurfaceCanvasExamples >> fillRectangleWithGray [
	<gtExample>
	| aSurface aCanvas aRectangle aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aRectangle := (10@10 corner: 60@40).
	aPaint := SkiaPaint new
		color: Color lightGray;
		paintStyle: SkiaPaintStyle Fill.
	
	aCanvas := aSurface canvas.
	aCanvas drawRectangle: aRectangle paint: aPaint.
	
	"this one is to show the actual rectangle path"
	aPaint strokeWidth: 1; color: Color black; paintStyle: SkiaPaintStyle Stroke.
	aCanvas drawRectangle: aRectangle paint: aPaint.
	
	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - draw rectangle' }
SkiaSurfaceCanvasExamples >> strokeAndFillRectangleWithGray [
	<gtExample>
	| aSurface aCanvas aRectangle aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aRectangle := (10@10 corner: 60@40).
	aPaint := SkiaPaint new
		color: Color lightGray;
		strokeWidth: 6;
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

{ #category : #'examples - draw rectangle' }
SkiaSurfaceCanvasExamples >> strokeRectangleWithGray [
	<gtExample>
	| aSurface aCanvas aRectangle aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aRectangle := (10@10 corner: 60@40).
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
