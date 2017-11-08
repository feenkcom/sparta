bitmap
fromFileNamed: aString
	"Create a bitmap surface from a picture file with a given path"
	<return: #TSpartaSurface>

	^ self fromForm: (ImageReadWriter formFromFileNamed: aString)