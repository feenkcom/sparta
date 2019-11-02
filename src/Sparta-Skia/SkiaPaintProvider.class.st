Class {
	#name : #SkiaPaintProvider,
	#superclass : #SpartaPaintProvider,
	#category : #'Sparta-Skia-Core'
}

{ #category : #paints }
SkiaPaintProvider >> linearGradient [
	^ SkiaLinearGradient new
]
