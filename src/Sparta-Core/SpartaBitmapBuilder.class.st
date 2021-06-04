"
I am a bitmap surface builder.

I am responsible for creation of bitmap surfaces out of for example Form or image on the disk. Surface plays an important role in drawing process and can be used as paint or as input source for a filter primitive.

Surfaces are backend specific which implies the fact that their creation is also backend specific. That is why developers should use me to create them. At the same time I must be accessed only through canvas and never instantiated directly.

Created surface have the same backend and format type as associated canvas. It is not recommened to mix surfaces created by canvases of different backends.

Public API and Key Messages

- fromForm: create a bitmap surface from Form
- fromFiledNamed: create a bitmap surface from image stored on the disk

Create a new surface from Form:
surface := canvas bitmap fromForm: (Smalltalk ui icons iconNamed: #classIcon).

Create a new surface from image file by its absolute or relative path:
surface := canvas bitmap fromFileNamed: 'images/cats/kitty.jpg'

"
Class {
	#name : #SpartaBitmapBuilder,
	#superclass : #SpartaAbstractBuilder,
	#category : #'Sparta-Core-Builders'
}

{ #category : #bitmap }
SpartaBitmapBuilder >> fromBuffer: aByteArray [
	"Create a bitmap surface from the supplied picture file contents"
	<return: #TSpartaSurface>

	^ self fromForm: (ImageReadWriter gtFormFromBuffer: aByteArray)
]

{ #category : #bitmap }
SpartaBitmapBuilder >> fromFileNamed: aString [
	"Create a bitmap surface from a picture file with a given path"
	<return: #TSpartaSurface>

	^ self fromForm: (ImageReadWriter formFromFileNamed: aString)
]

{ #category : #bitmap }
SpartaBitmapBuilder >> fromForm: aForm [
	"Create a bitmap surface from a given Form"
	<return: #TSpartaSurface>
	
	^ self subclassResponsibility
]

{ #category : #bitmap }
SpartaBitmapBuilder >> fromOpenGLTexture: aSpartaOpenGLTexture [
	"Create a surface from an OpenGL texture with a given ID.
	Note: a resulting surface takes ownership over the texture"
	<return: #TSpartaSurface>

	^ self subclassResponsibility
]
