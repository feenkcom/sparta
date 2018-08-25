Class {
	#name : #SpartaCairoGaussianBlurFilter,
	#superclass : #SpartaCairoSingleSourceFilter,
	#traits : 'TSpartaGaussianBlurFilter',
	#classTraits : 'TSpartaGaussianBlurFilter classTrait',
	#instVars : [
		'stdDeviation'
	],
	#category : 'Sparta-Cairo-Filters'
}

{ #category : #accessing }
SpartaCairoGaussianBlurFilter >> stdDeviation: aFloat [
	stdDeviation := aFloat
]
