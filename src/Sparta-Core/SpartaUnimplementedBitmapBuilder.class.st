Class {
	#name : #SpartaUnimplementedBitmapBuilder,
	#superclass : #SpartaBitmapBuilder,
	#category : #'Sparta-Core-Builders - Unimplemented'
}

{ #category : #bitmap }
SpartaUnimplementedBitmapBuilder >> fromForm: aForm [
	"Create a bitmap surface from a given Form"
	<return: #TSpartaSurface>
	
	^ self canvas similar: aForm extent
]

{ #category : #bitmap }
SpartaUnimplementedBitmapBuilder >> fromOpenGLTexture: aSpartaOpenGLTexture [
	"Create a surface from an OpenGL texture with a given ID.
	Note: a resulting surface takes ownership over the texture"
	<return: #TSpartaSurface>

	^ self canvas similar: aSpartaOpenGLTexture extent
]
