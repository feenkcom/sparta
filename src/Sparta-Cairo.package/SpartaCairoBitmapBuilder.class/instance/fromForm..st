bitmap
fromForm: aForm
	"Create a bitmap surface from a given Form"
	<return: #TSpartaSurface>
	| form aSurface newBits |
	
	form := aForm unhibernate; asFormOfDepth: 32.
	aSurface := SpartaCairoImageSurface
		createExtent: aForm extent
		format: SpartaCairoSurfaceFormat CAIRO_FORMAT_ARGB32.
	
	"we should convert form bits with premultiplied alpha"
	
	newBits := form bits collect:[:pixel |
		| alpha r g b|
		alpha := (pixel >> 24) / 255.
		
		r := ( (pixel bitAnd: 255) * alpha ) asInteger.
		g := ( (pixel >>8 bitAnd: 255) * alpha ) asInteger.
		b := ( (pixel >>16 bitAnd: 255) * alpha ) asInteger.
		
		(pixel bitAnd: 16rFF000000) + (b<<16) + (g<<8) + r ].
	
	LibC memCopy: newBits to: aSurface primData getHandle size: (form width * form height *4).
	
	aSurface markDirty.

	^ aSurface