Class {
	#name : #SpartaCairoSubpixelOrder,
	#superclass : #SpartaCairoEnum,
	#classVars : [
		'CAIRO_SUBPIXEL_ORDER_BGR',
		'CAIRO_SUBPIXEL_ORDER_DEFAULT',
		'CAIRO_SUBPIXEL_ORDER_RGB',
		'CAIRO_SUBPIXEL_ORDER_VBGR',
		'CAIRO_SUBPIXEL_ORDER_VRGB'
	],
	#category : 'Sparta-Cairo-Enums'
}

{ #category : #'accessing enum' }
SpartaCairoSubpixelOrder class >> CAIRO_SUBPIXEL_ORDER_BGR [
	"This method was automatically generated"
	^ CAIRO_SUBPIXEL_ORDER_BGR
]

{ #category : #'accessing enum' }
SpartaCairoSubpixelOrder class >> CAIRO_SUBPIXEL_ORDER_DEFAULT [
	"This method was automatically generated"
	^ CAIRO_SUBPIXEL_ORDER_DEFAULT
]

{ #category : #'accessing enum' }
SpartaCairoSubpixelOrder class >> CAIRO_SUBPIXEL_ORDER_RGB [
	"This method was automatically generated"
	^ CAIRO_SUBPIXEL_ORDER_RGB
]

{ #category : #'accessing enum' }
SpartaCairoSubpixelOrder class >> CAIRO_SUBPIXEL_ORDER_VBGR [
	"This method was automatically generated"
	^ CAIRO_SUBPIXEL_ORDER_VBGR
]

{ #category : #'accessing enum' }
SpartaCairoSubpixelOrder class >> CAIRO_SUBPIXEL_ORDER_VRGB [
	"This method was automatically generated"
	^ CAIRO_SUBPIXEL_ORDER_VRGB
]

{ #category : #'enum declaration' }
SpartaCairoSubpixelOrder class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		CAIRO_SUBPIXEL_ORDER_DEFAULT 0
		CAIRO_SUBPIXEL_ORDER_RGB 1
		CAIRO_SUBPIXEL_ORDER_BGR 2
		CAIRO_SUBPIXEL_ORDER_VRGB 3
		CAIRO_SUBPIXEL_ORDER_VBGR 4
	)
]

{ #category : #initialization }
SpartaCairoSubpixelOrder class >> initialize [
	super initialize
]
