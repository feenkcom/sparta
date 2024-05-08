Class {
	#name : #SkiaSurfaceCanvasExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #'examples - clip rectangle' }
SkiaSurfaceCanvasExamples >> clipRectangle [
	<gtExample>
	| aSurface aCanvas aRectangle |
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 70@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 70@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 70@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 70@50.

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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 50@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 50@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 70@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 70@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 70@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 50@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 70@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 50@50.
	
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

	aSurface := SkiaPixelSurface newRasterPremultipled: 400@400.
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 70@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 70@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 70@50.
	
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

	aSurface := SkiaPixelSurface newRasterPremultipled: 400@400.
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 400@400.
	
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

	aSurface := SkiaPixelSurface newRasterPremultipled: 400@400.
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

{ #category : #'examples - draw svg' }
SkiaSurfaceCanvasExamples >> drawSvg [
	<gtExample>
	| aFontManager anSvg aCanvas aSurface |
	
	aFontManager := SkiaFontManager default.
	anSvg := SkiaSvgDom parse: self snowMountainSvg fontManager: aFontManager.
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 800@600.
	
	aCanvas := aSurface canvas.
	aCanvas drawColor: Color white.
	aCanvas drawSvg: anSvg at: 0@0.
	
	aCanvas flush.
	
	^ aSurface
]

{ #category : #'examples - draw text blob' }
SkiaSurfaceCanvasExamples >> drawTextBlobHelloWorld [
	<gtExample>
	| aSurface aCanvas aFont aTextBlob aPaint |
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 400@300.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 400@300.
	
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
	<noTest>
	| aSurface aCanvas aPath aPaint |
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 800@500.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 50@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 50@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 70@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 70@50.
	
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
	
	aSurface := SkiaPixelSurface newRasterPremultipled: 70@50.
	
	aCanvas := aSurface canvas.
	self assert: aCanvas saveCount equals: 1.
	
	aCanvas save; save; save.
	self assert: aCanvas saveCount equals: 4.
	
	aCanvas restoreToCount: 1.
	self assert: aCanvas saveCount equals: 1.
	
	
	aCanvas release.
	
	^ aSurface
]

{ #category : #accessing }
SkiaSurfaceCanvasExamples >> snowMountainSvg [
	^ '<?xml version="1.0" encoding="utf-8"?>
<!-- Uploaded to: SVG Repo, www.svgrepo.com, Generator: SVG Repo Mixer Tools -->
<svg width="800px" height="800px" viewBox="0 0 1024 1024" class="icon"  version="1.1" xmlns="http://www.w3.org/2000/svg"><path d="M264 267.6c-5 0-7.5-3-12.7-10.2-5.1-7.2-12-17-25.7-17s-20.7 9.8-25.7 17c-5.1 7.3-7.7 10.2-12.7 10.2-5 0-7.5-3-12.7-10.2-5.1-7.2-12-17-25.7-17s-20.7 9.8-25.7 17c-5.1 7.3-7.7 10.2-12.7 10.2s-7.5-3-12.7-10.2c-5.1-7.2-12-17-25.7-17-4.4 0-8 3.6-8 8s3.6 8 8 8c5 0 7.5 3 12.7 10.2 5.1 7.2 12 17 25.7 17s20.7-9.8 25.7-17c5.1-7.3 7.7-10.2 12.7-10.2s7.5 3 12.7 10.2c5.1 7.2 12 17 25.7 17 13.8 0 20.7-9.8 25.7-17 5.1-7.3 7.7-10.2 12.7-10.2s7.5 3 12.7 10.2c5.1 7.2 12 17 25.7 17 4.4 0 8-3.6 8-8s-3.6-8-8-8zM72 206.4c5 0 7.5 3 12.7 10.2 5.1 7.2 12 17 25.7 17s20.7-9.8 25.7-17c5.1-7.3 7.7-10.2 12.7-10.2s7.5 3 12.7 10.2c5.1 7.2 12 17 25.7 17 13.8 0 20.7-9.8 25.7-17 5.1-7.3 7.7-10.2 12.7-10.2s7.5 3 12.7 10.2c5.1 7.2 12 17 25.7 17 4.4 0 8-3.6 8-8s-3.6-8-8-8c-5 0-7.5-3-12.7-10.2-5.1-7.2-12-17-25.7-17s-20.7 9.8-25.7 17c-5.1 7.3-7.7 10.2-12.7 10.2-5 0-7.5-3-12.7-10.2-5.1-7.2-12-17-25.7-17s-20.7 9.8-25.7 17c-5.1 7.3-7.7 10.2-12.7 10.2s-7.5-3-12.7-10.2c-5.1-7.2-12-17-25.7-17-4.4 0-8 3.6-8 8s3.6 8 8 8z" fill="#9A2D2F" /><path d="M343 104m-32 0a32 32 0 1 0 64 0 32 32 0 1 0-64 0Z" fill="#FFEB4D" /><path d="M343 144c-22.1 0-40-17.9-40-40s17.9-40 40-40 40 17.9 40 40-17.9 40-40 40z m0-64c-13.2 0-24 10.8-24 24s10.8 24 24 24 24-10.8 24-24-10.8-24-24-24z" fill="#9A2D2F" /><path d="M908 951H118L522.7 81z" fill="#E895AF" /><path d="M798 951H118L522.7 81z" fill="#FFACC2" /><path d="M590.8 297L522.4 81 422 297l80.1-27 19.7 27z" fill="#FFFFFF" /><path d="M952 687.6c-5 0-7.5-3-12.7-10.2-5.1-7.2-12-17-25.7-17s-20.7 9.8-25.7 17c-5.1 7.3-7.7 10.2-12.7 10.2-5 0-7.5-3-12.7-10.2-5.1-7.2-12-17-25.7-17s-20.7 9.8-25.7 17c-4.5 6.4-7.1 9.5-11 10.1L782.6 648c4 3.2 9.1 5.6 15.8 5.6 13.8 0 20.7-9.8 25.7-17 5.1-7.3 7.7-10.2 12.7-10.2s7.5 3 12.7 10.2c5.1 7.2 12 17 25.7 17 13.8 0 20.7-9.8 25.7-17 5.1-7.3 7.7-10.2 12.7-10.2s7.5 3 12.7 10.2c5.1 7.2 12 17 25.7 17 4.4 0 8-3.6 8-8s-3.6-8-8-8c-5 0-7.5-3-12.7-10.2-5.1-7.2-12-17-25.7-17s-20.7 9.8-25.7 17c-5.1 7.3-7.7 10.2-12.7 10.2-5 0-7.5-3-12.7-10.2-5.1-7.2-12-17-25.7-17s-20.7 9.8-25.7 17c-5.1 7.3-7.7 10.2-12.7 10.2-5 0-7.5-3-12.7-10.2-4.2-6-9.8-13.9-19.5-16.3L530 77.8c0-0.1-0.1-0.1-0.1-0.2s-0.1-0.2-0.2-0.3c-0.1-0.2-0.3-0.5-0.4-0.7-0.1-0.1-0.1-0.2-0.2-0.3-0.2-0.2-0.3-0.4-0.5-0.6l-0.3-0.3c-0.2-0.2-0.4-0.4-0.6-0.5-0.1-0.1-0.2-0.2-0.3-0.2-0.2-0.1-0.4-0.3-0.6-0.4-0.1-0.1-0.3-0.1-0.4-0.2l-0.6-0.3c-0.1-0.1-0.3-0.1-0.4-0.2-0.2-0.1-0.4-0.1-0.7-0.2-0.2 0-0.3-0.1-0.5-0.1s-0.5-0.1-0.7-0.1h-0.7-1.1c-0.2 0-0.4 0.1-0.6 0.1-0.1 0-0.3 0-0.4 0.1-2.4 0.5-4.5 2.1-5.6 4.4L414.8 293.6c-0.2 0.5-0.4 1-0.5 1.5L112.9 943H102c-4.4 0-8 3.6-8 8s3.6 8 8 8h824c4.4 0 8-3.6 8-8s-3.6-8-8-8h-12.8L806.6 702.3c8.5-2.9 13.6-10.1 17.5-15.7 5.1-7.3 7.7-10.2 12.7-10.2s7.5 3 12.7 10.2c5.1 7.2 12 17 25.7 17 13.8 0 20.7-9.8 25.7-17 5.1-7.3 7.7-10.2 12.7-10.2s7.5 3 12.7 10.2c5.1 7.2 12 17 25.7 17 4.4 0 8-3.6 8-8s-3.6-8-8-8zM521.1 103.3L579.9 289h-54l-17.3-23.7c-2.1-2.8-5.7-4-9-2.9l-62.2 21 83.7-180.1zM130.6 943l297.5-639.6 71.1-23.9 16.2 22.2c1.5 2.1 3.9 3.3 6.5 3.3h63.3l201.9 638H130.6z m673.3 0l-230-726.5L895.7 943h-91.8z" fill="#9A2D2F" /><path d="M672 950.5H118l283.8-609z" fill="#DAE5FF" /><path d="M594 950.5H118l283.3-609z" fill="#CAE8FF" /><path d="M449 492.5l-47.8-151-70.2 151 56-18.9 13.8 18.9z" fill="#FFFFFF" /><path d="M679.3 947.3l-270.2-609c-1.3-2.9-4.1-4.7-7.2-4.8h-0.3-1.1c-2.8 0.2-5.4 2-6.6 4.6l-70.2 151c0 0.1 0 0.1-0.1 0.2L110.8 947.1c-0.7 1.5-0.9 3.2-0.6 4.9 0 0.2 0.1 0.5 0.2 0.7 0 0.1 0 0.2 0.1 0.3 0 0.1 0.1 0.2 0.1 0.3 0.2 0.5 0.4 1 0.7 1.5 1.1 1.7 2.8 2.9 4.7 3.4 0.1 0 0.2 0 0.4 0.1 0.5 0.1 1.1 0.2 1.6 0.2h554c2.7 0 5.2-1.4 6.7-3.6 1.5-2.3 1.7-5.2 0.6-7.6zM400 364.2l38.1 120.3h-33.2l-11.4-15.6c-2.1-2.8-5.7-4-9-2.9l-37.8 12.8L400 364.2zM130.6 942.5l206.7-443.7 46.7-15.7 10.3 14.1c1.5 2.1 3.9 3.3 6.5 3.3h42.4l139.9 442H130.6z m469.3 0L451 472.2l208.7 470.3h-59.8z" fill="#9A2D2F" /><path d="M256.6 634.1L110.5 870.5c16.7-10.8 32.3-17.5 46.6-22.8l99.5-213.6zM232.5 803c20-37.3 8.5-116 60.5-149.5 38-24.5 48-62.5 48-88.5 0-18.9-7-35.5-13.9-44.3l-149 319.8c23.8-8.1 42.5-15.3 54.4-37.5z" fill="#FFFFFF" /></svg>'
]
