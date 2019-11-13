Class {
	#name : #SkiaFiltersFactory,
	#superclass : #SpartaFiltersFactory,
	#category : #'Sparta-Skia-Builders'
}

{ #category : #accessing }
SkiaFiltersFactory >> blur [
	<return: #TSpartaGaussianBlurFilter>
	
	^ SkiaGaussianBlurFilter new
]
