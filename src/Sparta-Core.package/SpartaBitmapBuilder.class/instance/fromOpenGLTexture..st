bitmap
fromOpenGLTexture: aSpartaOpenGLTexture
	"Create a surface from an OpenGL texture with a given ID.
	Note: a resulting surface takes ownership over the texture"
	<return: #TSpartaSurface>

	^ self subclassResponsibility