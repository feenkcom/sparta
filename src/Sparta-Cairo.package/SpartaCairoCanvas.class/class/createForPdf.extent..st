instance creation
createForPdf: aFileName extent: aPoint
	| aSurface |

	aSurface := SpartaCairoPdfSurface
		createExtent: aPoint
		fileNamed: aFileName.

	^ SpartaCairoPdfCanvas create: aSurface