Class {
	#name : #SkiaPaintProvider,
	#superclass : #SpartaPaintProvider,
	#category : #'Sparta-Skia-Builders'
}

{ #category : #paints }
SkiaPaintProvider >> linearGradient [
	^ SkiaLinearGradient new
]
