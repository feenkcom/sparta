instance creation
create: aSurface

	^ (self primCreate: aSurface)
		initialize;
		surface: aSurface;
		autoRelease;
		yourself