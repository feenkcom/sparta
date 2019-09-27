"
I provide users with backend specific paints.

Public API and Key Messages

- color: - to create a color paint from Color, provided paint is ready to use
- linearGradient - to initialize a linear gradient object that should be configured correctly by user
- radialGradient - to create a radial gradient  object that should be configured correctly by user

	 canvas paint color: Color red

	canvas paint linearGradient
		begin: 0@0;
		end: 300@300;
		stops: { 0 -> Color red. 1 -> Color blue }

	canvas paint radialGradient
		innerCenter: 150@150;
		outerRadius: 100;
		reflect;
		stops: { 0 -> Color red. 1 -> Color blue }
 
Internal Representation and Key Implementation Points.

	I am stateless and can be easily reused
"
Class {
	#name : #MozPaintProvider,
	#superclass : #SpartaPaintProvider,
	#category : 'Sparta-Moz2D-Builders'
}

{ #category : #paints }
MozPaintProvider >> color: aColor [
	"A color is already a paint in Sparta"
	^ aColor
]

{ #category : #paints }
MozPaintProvider >> form: aForm [
	"A form is already a paint in Sparta"
	^ aForm
]

{ #category : #paints }
MozPaintProvider >> linearGradient [
	"Generally, gradients are backend specific because of the way
	how extend mode and gradient stops are represented"
	^ MozLinearGradientPaint new
]

{ #category : #paints }
MozPaintProvider >> radialGradient [
	"Generally, gradients are backend specific because of the way
	how extend mode and gradient stops are represented"
	^ MozRadialGradientPaint new
]

{ #category : #paints }
MozPaintProvider >> surface [
	^ MozSurfacePaint new
]
