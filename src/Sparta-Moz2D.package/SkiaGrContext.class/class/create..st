instance creation
create: aBackend
	"Try to create a native GrContext with the given backend.
	Note, that this will succeed only if there is a window with initiazed context
	of the same type as a backend. If it is not the case I return a nullptr"
	<return: #SkiaGrContext>

	^ (self primCreateNative: aBackend)
		headless: false;
		yourself