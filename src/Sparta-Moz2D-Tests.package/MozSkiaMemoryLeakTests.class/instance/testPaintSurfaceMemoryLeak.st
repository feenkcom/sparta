tests
testPaintSurfaceMemoryLeak
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