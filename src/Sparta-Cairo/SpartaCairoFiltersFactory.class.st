Class {
	#name : #SpartaCairoFiltersFactory,
	#superclass : #SpartaFiltersFactory,
	#category : #'Sparta-Cairo-Builders'
}

{ #category : #accessing }
SpartaCairoFiltersFactory >> blur [
	<return: #TSpartaGaussianBlurFilter>
	
	^ SpartaCairoGaussianBlurFilter new
]
