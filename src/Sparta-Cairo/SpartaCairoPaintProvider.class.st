Class {
	#name : #SpartaCairoPaintProvider,
	#superclass : #SpartaPaintProvider,
	#category : #'Sparta-Cairo-Builders'
}

{ #category : #paints }
SpartaCairoPaintProvider >> form: aForm [
	"A form is already a paint in Sparta"
	^ aForm
]

{ #category : #paints }
SpartaCairoPaintProvider >> linearGradient [
	"Generally, gradients are backend specific because of the way
	how extend mode and gradient stops are represented"
	^ SpartaCairoLinearGradientPaint new
]

{ #category : #paints }
SpartaCairoPaintProvider >> radialGradient [
	"Generally, gradients are backend specific because of the way
	how extend mode and gradient stops are represented"
	^ SpartaCairoRadialGradientPaint new
]

{ #category : #paints }
SpartaCairoPaintProvider >> surface [
	^ SpartaCairoSurfacePaint new
]
