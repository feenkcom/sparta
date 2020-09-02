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
	"This example is currently platform specific.
	noTest should be removed once a platform independent color matching api has been added."
	<noTest>
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
	"This example is currently platform specific.
	noTest should be removed once a platform independent color matching api has been added."
	<noTest>
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

{ #category : #'examples - draw text blob' }
SkiaSurfaceCanvasExamples >> drawDefaultTextBlob [
	<gtExample>
	| aSurface aCanvas aTextBlob aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aTextBlob := SkiaTextBlob new.

	aPaint := SkiaPaint new
		color: Color lightGray;
		paintStyle: SkiaPaintStyle Fill.
	
	aCanvas := aSurface canvas.
	aCanvas drawTextBlob: aTextBlob at: 10@10 paint: aPaint.

	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - draw image' }
SkiaSurfaceCanvasExamples >> drawImage [
	<gtExample>
	| aWhiteSurface aWhiteCanvas aWhiteImage aSurface  aCanvas |
	
	"we draw a white image 1@1 that we will draw on top of the black surface"
	aWhiteSurface := SkiaSurfaceExamples new newRasterPremultipledSizeOne.
	
	aWhiteCanvas := aWhiteSurface canvas.
	aWhiteCanvas drawColor: Color white.
	aWhiteCanvas flush.
	aWhiteCanvas release.
	
	aWhiteImage := aWhiteSurface snapshot.

	self assert: aWhiteSurface data asArray equals: #(255 255 255 255).
	self assert: aWhiteImage data asArray equals: #(255 255 255 255).
	
	"create a black surface"
	aSurface := SkiaSurfaceExamples new newRasterPremultipledSizeOne.
	
	aCanvas := aSurface canvas.
	aCanvas drawColor: Color black.
	aCanvas flush.
	aCanvas release.
	
	self assert: aSurface data asArray equals: #(0 0 0 255).
	
	"we draw a white image on top of the black surface"
	aCanvas := aSurface canvas.
	aCanvas drawImage: aWhiteImage at: 0@0.
	aCanvas flush.
	aCanvas release.
	
	"it becomes white"
	self assert: aSurface data asArray equals: #(255 255 255 255).
	
	^ aSurface
]

{ #category : #'examples - image filter blur' }
SkiaSurfaceCanvasExamples >> drawImageWithBlur [
	<gtExample>
	| aSurface aCanvas anImage aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.

	aPaint := SkiaPaint new imageFilter: (SkiaImageFilterBlur sigma: 3@3).
	anImage := self drawPathTriangleWithGrayFill snapshot.
	
	aCanvas := aSurface canvas.
	aCanvas drawImage: anImage at: 0@0 paint: aPaint.
	aCanvas flush.
	aCanvas release.
	
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

{ #category : #'examples - image filter drop shadow' }
SkiaSurfaceCanvasExamples >> drawOvalWithBoxShadow [
	<gtExample>
	| aSurface aCanvas aRectangle aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aRectangle := SpartaRectangle fromRectangle: (10@10 corner: 60@40).

	aPaint := SkiaPaint new
		antialias: true;
		color: Color white;
		imageFilter: (SkiaImageFilterDropShadow delta: 4@4 sigma: 2@2 color: (Color black alpha: 0.5));
		paintStyle: SkiaPaintStyle Fill.
	
	aCanvas := aSurface canvas.
	aCanvas drawOval: aRectangle paint: aPaint.
	
	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - image filter drop shadow' }
SkiaSurfaceCanvasExamples >> drawOvalWithBoxShadowOnly [
	<gtExample>
	| aSurface aCanvas aRectangle aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aRectangle := SpartaRectangle fromRectangle: (10@10 corner: 60@40).

	aPaint := SkiaPaint new
		antialias: true;
		color: (Color white);
		imageFilter: (SkiaImageFilterDropShadowOnly delta: 4@4 sigma: 3@3 color: (Color black alpha: 1));
		paintStyle: SkiaPaintStyle Stroke.
	
	aCanvas := aSurface canvas.
	aCanvas drawOval: aRectangle paint: aPaint.
	
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

{ #category : #'examples - gradient conical' }
SkiaSurfaceCanvasExamples >> drawRectangleWithConicalGradient [
	<gtExample>
	| aSurface aCanvas aRectangle aPaint aShader |

	aSurface := SkiaSurface newRasterPremultipled: 400@400.
	aRectangle := SpartaRectangle fromRectangle: (50@50 corner: 350@350).

	"gradient should be given in local coordinates of the canvas"
	aShader := SkiaConicalGradientShader
		start: 200@200 radius: 150
		end: 200@60 radius: 10 
		colors: { Color blue . Color red }
		positions: { 0 . 1 }
		mode: SkiaTileMode Clamp
		flags: 0
		matrix: SpartaMatrix new.

	aPaint := SkiaPaint new
		shader: aShader;
		paintStyle: SkiaPaintStyle Fill.
	
	aCanvas := aSurface canvas.
	aCanvas drawRectangle: aRectangle paint: aPaint.

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

{ #category : #'examples - gradient linear' }
SkiaSurfaceCanvasExamples >> drawRectangleWithLinearGradient [
	<gtExample>
	| aSurface aCanvas aRectangle aPaint aShader |

	aSurface := SkiaSurface newRasterPremultipled: 400@400.
	aRectangle := SpartaRectangle fromRectangle: (50@50 corner: 350@350).

	"gradient should be given in local coordinates of the canvas"
	aShader := SkiaLinearGradientShader
		from: aRectangle origin to: aRectangle corner
		colors: { Color blue . Color red }
		positions: { 0 . 1 }
		mode: SkiaTileMode Clamp
		flags: 0
		matrix: SpartaMatrix new.

	aPaint := SkiaPaint new
		shader: aShader;
		paintStyle: SkiaPaintStyle Fill.
	
	aCanvas := aSurface canvas.
	aCanvas drawRectangle: aRectangle paint: aPaint.

	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - gradient radial' }
SkiaSurfaceCanvasExamples >> drawRectangleWithRadialGradient [
	<gtExample>
	| aSurface aCanvas aRectangle aPaint aShader |
	
	aSurface := SkiaSurface newRasterPremultipled: 400@400.
	
	aRectangle := SpartaRectangle fromRectangle: (50@50 corner: 350@350).

	"gradient should be given in local coordinates of the canvas"
	aShader := SkiaRadialGradientShader
		center: 200@200
		radius: 200
		colors: { Color blue . Color red }
		positions: { 0 . 1 }
		mode: SkiaTileMode Clamp
		flags: 0
		matrix: SpartaMatrix new.

	aPaint := SkiaPaint new
		shader: aShader;
		paintStyle: SkiaPaintStyle Fill.
	
	aCanvas := aSurface canvas.
	aCanvas drawRectangle: aRectangle paint: aPaint.

	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - gradient sweep' }
SkiaSurfaceCanvasExamples >> drawRectangleWithSweepGradient [
	<gtExample>
	| aSurface aCanvas aRectangle aPaint aShader |

	aSurface := SkiaSurface newRasterPremultipled: 400@400.
	aRectangle := SpartaRectangle fromRectangle: (50@50 corner: 350@350).

	"gradient should be given in local coordinates of the canvas"
	aShader := SkiaSweepGradientShader
		center: 200@200
		startAngle: 0
		endAngle: 200
		colors: { Color blue . Color red }
		positions: { 0 . 1 }
		mode: SkiaTileMode Clamp
		flags: 0
		matrix: SpartaMatrix new.

	aPaint := SkiaPaint new
		shader: aShader;
		paintStyle: SkiaPaintStyle Fill.
	
	aCanvas := aSurface canvas.
	aCanvas drawRectangle: aRectangle paint: aPaint.

	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - draw text blob' }
SkiaSurfaceCanvasExamples >> drawTextBlobHelloWorld [
	<gtExample>
	| aSurface aCanvas aFont aTextBlob aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 400@300.
	
	aFont := SkiaFont size: 30.
	
	aTextBlob := SkiaTextBlob string: 'Hello World!' font: aFont.
	aPaint := SkiaPaint new
		color: Color lightGray;
		paintStyle: SkiaPaintStyle Fill.
	
	aCanvas := aSurface canvas.
	aCanvas drawTextBlob: aTextBlob at: 50@100 paint: aPaint.

	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - draw text blob' }
SkiaSurfaceCanvasExamples >> drawTextBlobHelloWorldFromGlyphs [
	<gtExample>
	| aSurface aCanvas aFont theGlyphs aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 400@300.
	
	aFont := SkiaFont size: 30.
	theGlyphs := aFont stringToGlyphs: 'Hello World!'.
	
	aPaint := SkiaPaint new
		color: Color lightGray;
		paintStyle: SkiaPaintStyle Fill.
	
	aCanvas := aSurface canvas.
	
	SkiaTextBlob glyphs: theGlyphs font: aFont during: [ :aTextBlob |
		aCanvas drawTextBlob: aTextBlob at: 50@100 paint: aPaint.
	].

	aCanvas flush.
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - draw shadow' }
SkiaSurfaceCanvasExamples >> drawTriangleShadow [
	<gtExample>
	| aSurface aCanvas aPath aPaint |
	
	aSurface := SkiaSurface newRasterPremultipled: 800@500.
	
	aPath := SkiaPath new
		moveTo: 100@400;
		lineTo: 350@100;
		lineTo: 600@400;
		close.
	
	aCanvas := aSurface canvas.
	
	aCanvas
		drawShadowPath: aPath
		zPlane: (GtBoxerPoint3F32 x: 0.1 y: 0.2 z: 0.1)
		lightPos: (GtBoxerPoint3F32 x: 350 y: 350 z: 10)
		lightRadius: 0
		ambientColor: (Color black alpha: 1)
		spotColor: (Color white alpha: 1)
		flags: 0.
		
	aPaint := SkiaPaint new
		antialias: true;
		color: Color white;
		strokeWidth: 1;
		paintStyle: SkiaPaintStyle Stroke.
		
	aCanvas drawPath: aPath paint: aPaint.
	
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

{ #category : #'examples - state' }
SkiaSurfaceCanvasExamples >> saveAndRestoreLayer [
	<gtExample>
	| aSurface aCanvas aSaveLayerRec |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aCanvas := aSurface canvas.
	self assert: aCanvas saveCount equals: 1.
	
	aSaveLayerRec := SkiaSaveLayerRec new.
	
	aCanvas saveLayer: aSaveLayerRec.
	self assert: aCanvas saveCount equals: 2.
	
	aCanvas restore.
	self assert: aCanvas saveCount equals: 1.
	
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - state' }
SkiaSurfaceCanvasExamples >> saveAndRestoreState [
	<gtExample>
	| aSurface aCanvas |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aCanvas := aSurface canvas.
	self assert: aCanvas saveCount equals: 1.
	
	aCanvas save.
	self assert: aCanvas saveCount equals: 2.
	
	aCanvas restore.
	self assert: aCanvas saveCount equals: 1.
	
	
	aCanvas release.
	
	^ aSurface
]

{ #category : #'examples - state' }
SkiaSurfaceCanvasExamples >> saveAndRestoreToCountState [
	<gtExample>
	| aSurface aCanvas |
	
	aSurface := SkiaSurface newRasterPremultipled: 70@50.
	
	aCanvas := aSurface canvas.
	self assert: aCanvas saveCount equals: 1.
	
	aCanvas save; save; save.
	self assert: aCanvas saveCount equals: 4.
	
	aCanvas restoreToCount: 1.
	self assert: aCanvas saveCount equals: 1.
	
	
	aCanvas release.
	
	^ aSurface
]
