"
! TSpartaRadialGradient

I define an api of a radial gradient. Backend specific radial gradient must implement all my methods.

!! Overview

I am responsible for setting inner and outer radius as also inner and outer center of a radial gradient. Radii are defined as Numbers while centers as Points in user space coordinate system. I also add a few path-paint dispatch methods.

Radial gradients must be created using paint builder provided by canvas: ==canvas paint radialGradient==

!! Public API and Key Messages

- ==innerCenter:== - set inner center of the gradient circle
- ==outerCenter:== - set outer center of the gradient circle
- ==innerRadius:== - set radius of inner circle
- ==outerRadius:== - set radius of outer circle

!! See
- *Paint>../TSpartaPaint.trait/README.md*
- *Gradient>../TSpartaGradientPaint.trait/README.md*
- *Linear gradient>../TSpartaLinearGradientPaint.trait/README.md*
- *Canvas>../SpartaCanvas.class/README.md*
- *Sparta>/README.md*

!! Example:

Simple gradient to fill rectangle (0@0 extent: 400@250):
[[[languagae=smalltalk
canvas paint radialGradient
	stops: { 0 -> Color red  . 0.5 -> Color purple . 1 -> Color blue };
	innerCenter: 100@25;
	innerRadius: 40;
	outerRadius: 400.
]]]
+https://github.com/syrel/Sparta/raw/master/images/TSpartaRadialGradientPaint/01_radial_smooth.png|label=smoothGradient+

Complex radial gradient that reflects itself to fill rectangle (0@0 extent: 400@250):
[[[languagae=smalltalk
canvas paint radialGradient
	stops: { 0 -> Color red . 0.5 -> Color purple . 1 -> Color blue };
	innerCenter: 100@75;
	outerRadius: 50;
	reflect.
]]]

+https://github.com/syrel/Sparta/raw/master/images/TSpartaRadialGradientPaint/02_radial_waves.png|label=advancedGradient+

"
Trait {
	#name : #TSpartaRadialGradientPaint,
	#category : #'Sparta-Core-Paints'
}

{ #category : #accessing }
TSpartaRadialGradientPaint >> center: aPoint [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaRadialGradientPaint >> radius: aNumber [
	^ self explicitRequirement
]

{ #category : #dispatch }
TSpartaRadialGradientPaint >> spartaFillCircle: aSpartaCircle with: aFillPainter [
	aFillPainter fillCircle: aSpartaCircle withRadialGradient: self
]

{ #category : #dispatch }
TSpartaRadialGradientPaint >> spartaFillPath: aPath with: aFillPainter [
	aFillPainter fillPath: aPath withRadialGradient: self
]

{ #category : #dispatch }
TSpartaRadialGradientPaint >> spartaFillRectangle: aRectangle with: aFillPainter [
	aFillPainter fillRectangle: aRectangle withRadialGradient: self
]

{ #category : #dispatch }
TSpartaRadialGradientPaint >> spartaFillRoundedRectangle: aRectangle with: aFillPainter [
	aFillPainter fillRoundedRectangle: aRectangle withRadialGradient: self
]

{ #category : #dispatch }
TSpartaRadialGradientPaint >> spartaStrokeCircle: aSpartaCircle with: aStrokePainter [
	aStrokePainter strokeCircle: aSpartaCircle withRadialGradient: self
]

{ #category : #dispatch }
TSpartaRadialGradientPaint >> spartaStrokeLine: aLine with: aStrokePainter [
	aStrokePainter strokeLine: aLine withRadialGradient: self
]

{ #category : #dispatch }
TSpartaRadialGradientPaint >> spartaStrokePath: aPath with: aStrokePainter [
	aStrokePainter strokePath: aPath withRadialGradient: self
]

{ #category : #dispatch }
TSpartaRadialGradientPaint >> spartaStrokeRectangle: aPath with: aStrokePainter [
	aStrokePainter strokeRectangle: aPath withRadialGradient: self
]

{ #category : #dispatch }
TSpartaRadialGradientPaint >> spartaStrokeRoundedRectangle: aRoundedRectangle with: aStrokePainter [
	aStrokePainter strokeRoundedRectangle: aRoundedRectangle withRadialGradient: self
]
