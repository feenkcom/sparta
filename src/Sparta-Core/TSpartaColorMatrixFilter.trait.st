Trait {
	#name : #TSpartaColorMatrixFilter,
	#category : #'Sparta-Core-Filters'
}

{ #category : #accessing }
TSpartaColorMatrixFilter >> alphaPremiltiplied [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaColorMatrixFilter >> alphaStraight [
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaColorMatrixFilter >> matrix: anArrayOfFloats [
	"Matrix must be 5x4
	
	#(a11 a12 a13 a14
	  a21 a22 a23 a24
	  a31 a32 a33 a34
	  a41 a42 a43 a44
	  a51 a52 a53 a54)
	"
	
	^ self explicitRequirement

]
