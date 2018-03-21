instance creation
createForSvg: aFileName extent: aPoint
	| aSurface |

	aSurface := SpartaCairoSvgSurface
		createExtent: aPoint
		fileNamed: aFileName.

	^ SpartaCairoSvgCanvas create: aSurface