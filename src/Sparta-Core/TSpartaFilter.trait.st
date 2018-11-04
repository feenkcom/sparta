"
I define a minimum set of apis that every filter primitive should have.
"
Trait {
	#name : #TSpartaFilter,
	#category : #'Sparta-Core-Filters-Traits'
}

{ #category : #dispatch }
TSpartaFilter >> asFilterSecondSourceOn: aFilter [
	aFilter secondSourceFilter: self
]

{ #category : #dispatch }
TSpartaFilter >> asFilterSourceOn: aFilter [
	aFilter sourceFilter: self
]
