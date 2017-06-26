enum declaration
enumDecl
	"
	self rebuildEnumAccessors
	"

	^ #(
		D3D10_TEXTURE 0
		CAIRO_CONTEXT 1
		CGCONTEXT 2
		CGCONTEXT_ACCELERATED 3
		OPENGL_TEXTURE 4
	)