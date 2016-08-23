enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		DATA 0 							"Data surface - bitmap in memory"
		D2D1_BITMAP 1 					"Surface wrapping a ID2D1Bitmap"
		D2D1_DRAWTARGET 2 				"Surface made from a D2D draw target"
		CAIRO 3 							"Surface wrapping a cairo surface"
		CAIRO_IMAGE 4 					"Data surface wrapping a cairo image surface"
		COREGRAPHICS_IMAGE 5 			"Surface wrapping a CoreGraphics Image"
		COREGRAPHICS_CGCONTEXT 6 	"Surface wrapping a CG context"
		SKIA 7 							"Surface wrapping a Skia bitmap"
		DUAL_DT 8 						"Snapshot of a dual drawtarget"
		D2D1_1_IMAGE 9 					"A D2D 1.1 ID2D1Image SourceSurface"
		RECORDING 10 					"Surface used for recording"
		TILED 11 							"Surface from a tiled DrawTarget"
	)