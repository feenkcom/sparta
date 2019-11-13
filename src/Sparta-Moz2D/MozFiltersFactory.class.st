Class {
	#name : #MozFiltersFactory,
	#superclass : #SpartaFiltersFactory,
	#category : #'Sparta-Moz2D-Builders'
}

{ #category : #accessing }
MozFiltersFactory >> blur [
	<return: #TSpartaGaussianBlurFilter>

	^ MozGaussianBlurFilter createOn: self canvas
]
