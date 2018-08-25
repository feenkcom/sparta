Class {
	#name : #SpartaCairoSurfaceFormat,
	#superclass : #SpartaCairoEnum,
	#classVars : [
		'CAIRO_FORMAT_A1',
		'CAIRO_FORMAT_A8',
		'CAIRO_FORMAT_ARGB32',
		'CAIRO_FORMAT_INVALID',
		'CAIRO_FORMAT_RGB16_565',
		'CAIRO_FORMAT_RGB24',
		'CAIRO_FORMAT_RGB30'
	],
	#category : 'Sparta-Cairo-Enums'
}

{ #category : #'accessing enum' }
SpartaCairoSurfaceFormat class >> CAIRO_FORMAT_A1 [
	"This method was automatically generated"
	^ CAIRO_FORMAT_A1
]

{ #category : #'accessing enum' }
SpartaCairoSurfaceFormat class >> CAIRO_FORMAT_A8 [
	"This method was automatically generated"
	^ CAIRO_FORMAT_A8
]

{ #category : #'accessing enum' }
SpartaCairoSurfaceFormat class >> CAIRO_FORMAT_ARGB32 [
	"This method was automatically generated"
	^ CAIRO_FORMAT_ARGB32
]

{ #category : #'accessing enum' }
SpartaCairoSurfaceFormat class >> CAIRO_FORMAT_INVALID [
	"This method was automatically generated"
	^ CAIRO_FORMAT_INVALID
]

{ #category : #'accessing enum' }
SpartaCairoSurfaceFormat class >> CAIRO_FORMAT_RGB16_565 [
	"This method was automatically generated"
	^ CAIRO_FORMAT_RGB16_565
]

{ #category : #'accessing enum' }
SpartaCairoSurfaceFormat class >> CAIRO_FORMAT_RGB24 [
	"This method was automatically generated"
	^ CAIRO_FORMAT_RGB24
]

{ #category : #'accessing enum' }
SpartaCairoSurfaceFormat class >> CAIRO_FORMAT_RGB30 [
	"This method was automatically generated"
	^ CAIRO_FORMAT_RGB30
]

{ #category : #'enum declaration' }
SpartaCairoSurfaceFormat class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		CAIRO_FORMAT_INVALID -1
		CAIRO_FORMAT_ARGB32 0
		CAIRO_FORMAT_RGB24	 1
		CAIRO_FORMAT_A8	 2
		CAIRO_FORMAT_A1	 3
		CAIRO_FORMAT_RGB16_565 4
		CAIRO_FORMAT_RGB30	5
	)
]

{ #category : #initialization }
SpartaCairoSurfaceFormat class >> initialize [
	super initialize
]
