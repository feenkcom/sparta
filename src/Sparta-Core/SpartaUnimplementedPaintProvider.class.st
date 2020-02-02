Class {
	#name : #SpartaUnimplementedPaintProvider,
	#superclass : #SpartaPaintProvider,
	#category : #'Sparta-Core-Builders - Unimplemented'
}

{ #category : #paints }
SpartaUnimplementedPaintProvider >> boxShadow [
	^ SpartaUnimplementedBoxShadowPaint new
]

{ #category : #paints }
SpartaUnimplementedPaintProvider >> linearGradient [
	^ SpartaUnimplementedLinearGradientPaint new
]

{ #category : #paints }
SpartaUnimplementedPaintProvider >> radialGradient [
	^ SpartaUnimplementedRadialGradientPaint new
]

{ #category : #paints }
SpartaUnimplementedPaintProvider >> surface [
	^ SpartaUnimplementedSurfacePaint new
]
