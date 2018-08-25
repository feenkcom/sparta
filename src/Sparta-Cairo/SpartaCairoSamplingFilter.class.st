Class {
	#name : #SpartaCairoSamplingFilter,
	#superclass : #SpartaCairoEnum,
	#classVars : [
		'CAIRO_FILTER_BEST',
		'CAIRO_FILTER_BILINEAR',
		'CAIRO_FILTER_FAST',
		'CAIRO_FILTER_GAUSSIAN',
		'CAIRO_FILTER_GOOD',
		'CAIRO_FILTER_NEAREST'
	],
	#category : 'Sparta-Cairo-Enums'
}

{ #category : #'accessing enum' }
SpartaCairoSamplingFilter class >> CAIRO_FILTER_BEST [
	"This method was automatically generated"
	^ CAIRO_FILTER_BEST
]

{ #category : #'accessing enum' }
SpartaCairoSamplingFilter class >> CAIRO_FILTER_BILINEAR [
	"This method was automatically generated"
	^ CAIRO_FILTER_BILINEAR
]

{ #category : #'accessing enum' }
SpartaCairoSamplingFilter class >> CAIRO_FILTER_FAST [
	"This method was automatically generated"
	^ CAIRO_FILTER_FAST
]

{ #category : #'accessing enum' }
SpartaCairoSamplingFilter class >> CAIRO_FILTER_GAUSSIAN [
	"This method was automatically generated"
	^ CAIRO_FILTER_GAUSSIAN
]

{ #category : #'accessing enum' }
SpartaCairoSamplingFilter class >> CAIRO_FILTER_GOOD [
	"This method was automatically generated"
	^ CAIRO_FILTER_GOOD
]

{ #category : #'accessing enum' }
SpartaCairoSamplingFilter class >> CAIRO_FILTER_NEAREST [
	"This method was automatically generated"
	^ CAIRO_FILTER_NEAREST
]

{ #category : #'enum declaration' }
SpartaCairoSamplingFilter class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		CAIRO_FILTER_FAST 0
		CAIRO_FILTER_GOOD 1
		CAIRO_FILTER_BEST 2
		CAIRO_FILTER_NEAREST 3
		CAIRO_FILTER_BILINEAR 4
		CAIRO_FILTER_GAUSSIAN 5
	)
]

{ #category : #initialization }
SpartaCairoSamplingFilter class >> initialize [
	super initialize
]
