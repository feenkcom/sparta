Class {
	#name : #MozSkiaMemoryLeakTests,
	#superclass : #MozTestCase,
	#instVars : [
		'canvas'
	],
	#category : #'Sparta-Moz2D-Tests'
}

{ #category : #initialization }
MozSkiaMemoryLeakTests >> defaultExtent [
	^ 500@500
]

{ #category : #initialization }
MozSkiaMemoryLeakTests >> setUp [
	super setUp.
	
	canvas := MozCanvas
		createType: MozBackendType SKIA
		extent: self defaultExtent
		format: MozSurfaceFormat B8G8R8A8
]

{ #category : #running }
MozSkiaMemoryLeakTests >> tearDown [
	super tearDown.
	
	canvas release.
	canvas := nil
]

{ #category : #tests }
MozSkiaMemoryLeakTests >> testPaintSurfaceMemoryLeak [
	| aSimilarCanvas aSurface aSurfacePaint aSurfacePattern |

	aSimilarCanvas := canvas similar: self defaultExtent.
	"We own canvas => 1 reference"
	self assert: aSimilarCanvas refCount equals: 1.

	aSurface := aSimilarCanvas surface.
	"canvas does not own surface (it calls .forget())
	we own surface => 1 reference"
	self assert: aSurface refCount equals: 1.

	"surface stores reference to canvas, so it get one more"
	self assert: aSimilarCanvas refCount equals: 2.

	aSurfacePaint := aSimilarCanvas paint surface source: aSurface.
	aSurfacePattern := aSimilarCanvas pattern surface: aSurfacePaint.

	"we created a pattern which add one surface reference => 2"
	self assert: aSurface refCount equals: 2.

	canvas fill
		paint: aSurfacePattern;
		path: aSurface bounds;
		draw.
	
	"drawing operation must not introduce new references"
	self assert: aSimilarCanvas refCount equals: 2.
	self assert: aSurface refCount equals: 2.

	"we release (destroy) pattern"
	aSurfacePattern release.

	"pattern no longer references surface, so ref count decreases from 2 to 1"
	self assert: aSurface refCount equals: 1.
	"canvas still own by us and surface"
	self assert: aSimilarCanvas refCount equals: 2.

	"next we release surface"
	aSurface release.
	
	"and get only one reference to canvas"
	self assert: aSimilarCanvas refCount equals: 1
]

{ #category : #tests }
MozSkiaMemoryLeakTests >> testPaintSurfaceNoPatternMemoryLeak [
	| aSimilarCanvas aSurface |

	aSimilarCanvas := canvas similar: self defaultExtent.
	"We own canvas => 1 reference"
	self assert: aSimilarCanvas refCount equals: 1.

	aSurface := aSimilarCanvas surface.
	"canvas does not own surface (it calls .forget())
	we own surface => 1 reference"
	self assert: aSurface refCount equals: 1.

	"surface stores reference to canvas, so it get one more"
	self assert: aSimilarCanvas refCount equals: 2.
	"we created a pattern which add one surface reference => 2"
	self assert: aSurface refCount equals: 1.

	canvas fill
		paint: aSurface;
		path: aSurface bounds;
		draw.

	"drawing operation must not introduce new references"
	self assert: aSimilarCanvas refCount equals: 2.
	self assert: aSurface refCount equals: 1.

	"next we release surface"
	aSurface release.
	
	"and get only one reference to canvas"
	self assert: aSimilarCanvas refCount equals: 1
]

{ #category : #tests }
MozSkiaMemoryLeakTests >> testSurfacePatternMemoryLeak [
	| aSurface aSurfacePaint aSurfacePattern |

	aSurface := canvas surface.
	"canvas does not own surface (it calls .forget())
	we own surface => 1 reference"
	self assert: aSurface refCount equals: 1.

	aSurfacePaint := canvas paint surface source: aSurface.
	aSurfacePattern := canvas pattern surface: aSurfacePaint.

	"surface pattern owns additional reference, so we get 2 of them"
	self assert: aSurface refCount equals: 2.

	aSurfacePattern release.

	"drawing operation must not introduce references"
	self assert: aSurface refCount equals: 1
]
