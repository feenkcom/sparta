instance creation
fromOpenGLTexture: aSpartaOpenGLTexture
	| format aGLuid surface |
	
	format := aSpartaOpenGLTexture format
		ifNil: [ MozSurfaceFormat B8G8R8A8 ].
	
	aGLuid := FFIExternalArray newType: 'int' size: 1.
	aGLuid at: 1 put: aSpartaOpenGLTexture id.
	
	surface := (self
		primCreateSurfaceFromNative: aSpartaOpenGLTexture id
		width: aSpartaOpenGLTexture extent x
		height: aSpartaOpenGLTexture extent y
		type: MozNativeSurfaceType OPENGL_TEXTURE
		format: format) autoRelease.
	
	aGLuid free.
	
	^ surface