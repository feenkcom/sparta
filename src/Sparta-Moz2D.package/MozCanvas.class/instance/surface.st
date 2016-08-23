accessing
surface
	"Return a snapshot of the surface.
	
	Every surface access increases refCount by one.
	On first call refCount equals 2, since surface is referenced by
	draw target, plus one our reference. As soon as surface is not
	referenced on image side its refCount must be decreased by one
	calling Release() on the reference within finalizeResourceData:"
	<return: #SpartaSurface>
	
	^ self primSnapshot autoRelease