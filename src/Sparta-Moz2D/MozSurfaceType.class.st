Class {
	#name : #MozSurfaceType,
	#superclass : #MozEnum,
	#classVars : [
		'CAIRO',
		'CAIRO_IMAGE',
		'COREGRAPHICS_CGCONTEXT',
		'COREGRAPHICS_IMAGE',
		'D2D1_1_IMAGE',
		'D2D1_BITMAP',
		'D2D1_DRAWTARGET',
		'DATA',
		'DUAL_DT',
		'RECORDING',
		'SKIA',
		'TILED'
	],
	#category : 'Sparta-Moz2D-Enums'
}

{ #category : #'accessing enum' }
MozSurfaceType class >> CAIRO [
	"This method was automatically generated"
	^ CAIRO
]

{ #category : #'accessing enum' }
MozSurfaceType class >> CAIRO_IMAGE [
	"This method was automatically generated"
	^ CAIRO_IMAGE
]

{ #category : #'accessing enum' }
MozSurfaceType class >> COREGRAPHICS_CGCONTEXT [
	"This method was automatically generated"
	^ COREGRAPHICS_CGCONTEXT
]

{ #category : #'accessing enum' }
MozSurfaceType class >> COREGRAPHICS_IMAGE [
	"This method was automatically generated"
	^ COREGRAPHICS_IMAGE
]

{ #category : #'accessing enum' }
MozSurfaceType class >> D2D1_1_IMAGE [
	"This method was automatically generated"
	^ D2D1_1_IMAGE
]

{ #category : #'accessing enum' }
MozSurfaceType class >> D2D1_BITMAP [
	"This method was automatically generated"
	^ D2D1_BITMAP
]

{ #category : #'accessing enum' }
MozSurfaceType class >> D2D1_DRAWTARGET [
	"This method was automatically generated"
	^ D2D1_DRAWTARGET
]

{ #category : #'accessing enum' }
MozSurfaceType class >> DATA [
	"This method was automatically generated"
	^ DATA
]

{ #category : #'accessing enum' }
MozSurfaceType class >> DUAL_DT [
	"This method was automatically generated"
	^ DUAL_DT
]

{ #category : #'accessing enum' }
MozSurfaceType class >> RECORDING [
	"This method was automatically generated"
	^ RECORDING
]

{ #category : #'accessing enum' }
MozSurfaceType class >> SKIA [
	"This method was automatically generated"
	^ SKIA
]

{ #category : #'accessing enum' }
MozSurfaceType class >> TILED [
	"This method was automatically generated"
	^ TILED
]

{ #category : #'enum declaration' }
MozSurfaceType class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		DATA 0 							"Data surface - bitmap in memory"
		D2D1_BITMAP 1 					"Surface wrapping a ID2D1Bitmap"
		D2D1_DRAWTARGET 2 				"Surface made from a D2D draw target"
		CAIRO 3 							"Surface wrapping a cairo surface"
		CAIRO_IMAGE 4 					"Data surface wrapping a cairo image surface"
		COREGRAPHICS_IMAGE 5 			"Surface wrapping a CoreGraphics Image"
		COREGRAPHICS_CGCONTEXT 6 	"Surface wrapping a CG context"
		SKIA 7 							"Surface wrapping a Skia bitmap"
		DUAL_DT 8 						"Snapshot of a dual drawtarget"
		D2D1_1_IMAGE 9 					"A D2D 1.1 ID2D1Image SourceSurface"
		RECORDING 10 					"Surface used for recording"
		TILED 11 							"Surface from a tiled DrawTarget"
	)
]

{ #category : #accessing }
MozSurfaceType class >> externalEnum [
	^ #SurfaceType
]

{ #category : #accessing }
MozSurfaceType class >> externalType [
	^ FFIInt8 new
]

{ #category : #'class initialization' }
MozSurfaceType class >> initialize [
	super initialize
]
