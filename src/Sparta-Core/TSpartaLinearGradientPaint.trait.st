"
! TSpartaLinearGradient

I define an api of a linear gradient. Backend specific linear gradient must implement all my methods.

!! Overview

I am responsible for setting ==begin== and ==end== of a linear gradient. They are defined as Points in user space coordiante system. I also add a few path-paint dispatch methods.

Linear gradients must be created using paint builder provided by canvas: ==canvas paint linearGradient==

!! Public API and Key Messages

- ==begin:== - set a coordiante where linear gradient starts
- ==end:== - set and end point of a gradient

!! See
- *Paint>../TSpartaPaint.trait/README.md*
-- *Gradient>../TSpartaGradientPaint.trait/README.md*
--- *Radial>../TSpartaRadialGradientPaint.trait/README.md*
--- *Canvas>../SpartaCanvas.class/README.md*
- *Sparta>/README.md*

!! Example:

Simple gradient to fill rectangle (0@0 extent: 400@250):
[[[languagae=smalltalk
canvas paint linearGradient
	stops: { 0 -> Color red  . 0.5 -> Color purple . 1 -> Color blue };
	begin: 0@0;
	end: 400@250.
]]]
+https://github.com/syrel/Sparta/raw/master/images/TSpartaLinearGradientPaint/02_smooth_red_blue.png|label=smoothGradient+

Complex gradient rotated by 45 degrees that reflects itself to fill rectangle (0@0 extent: 400@250):
[[[languagae=smalltalk
canvas paint linearGradient
	stops: { 0 -> Color red . 0.5 -> Color green. 1 -> Color blue };
	begin: 0@0;
	end: 0@50; ""define horizontal gradient""
	rotateByDegrees: 45;
	reflect.
]]]

+https://github.com/syrel/Sparta/raw/master/images/TSpartaLinearGradientPaint/01_red_blue.png|label=advancedGradient+

"
Trait {
	#name : #TSpartaLinearGradientPaint,
	#category : #'Sparta-Core-Paints'
}

{ #category : #accessing }
TSpartaLinearGradientPaint >> begin: aPoint [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaLinearGradientPaint >> end: aPoint [
	^ self explicitRequirement
]

{ #category : #dispatch }
TSpartaLinearGradientPaint >> spartaFillPath: aPath with: aFillPainter [
	aFillPainter fillPath: aPath withLinearGradient: self
]

{ #category : #dispatch }
TSpartaLinearGradientPaint >> spartaFillRectangle: aPath with: aFillPainter [
	aFillPainter fillRectangle: aPath withLinearGradient: self
]

{ #category : #dispatch }
TSpartaLinearGradientPaint >> spartaStrokeLine: aLine with: aStrokePainter [
	aStrokePainter strokeLine: aLine withLinearGradient: self
]

{ #category : #dispatch }
TSpartaLinearGradientPaint >> spartaStrokePath: aPath with: aStrokePainter [
	aStrokePainter strokePath: aPath withLinearGradient: self
]

{ #category : #dispatch }
TSpartaLinearGradientPaint >> spartaStrokeRectangle: aRectangle with: aStrokePainter [
	aStrokePainter strokeRectangle: aRectangle withLinearGradient: self
]
