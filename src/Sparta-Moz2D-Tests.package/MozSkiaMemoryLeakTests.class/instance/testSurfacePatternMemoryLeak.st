tests
testSurfacePatternMemoryLeak
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