Class {
	#name : #SkiaPaintProvider,
	#superclass : #SpartaPaintProvider,
	#category : #'Sparta-Skia-Builders'
}

{ #category : #paints }
SkiaPaintProvider >> boxShadow [
	^ SkiaBoxShadowPaint new
]

{ #category : #paints }
SkiaPaintProvider >> linearGradient [
	^ SkiaLinearGradient new
]

{ #category : #paints }
SkiaPaintProvider >> radialGradient [
	^ SkiaRadialGradient new
]

{ #category : #paints }
SkiaPaintProvider >> surface [
	^ SkiaSurfacePaint new
]
