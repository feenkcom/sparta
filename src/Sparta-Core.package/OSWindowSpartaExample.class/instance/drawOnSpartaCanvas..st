drawing
drawOnSpartaCanvas: aSpartaCanvas
	"Override to actually draw anything.
	By default we clean surface"
	aSpartaCanvas fill
		paint: Color white;
		path: (0@0 extent: aSpartaCanvas extent);
		draw