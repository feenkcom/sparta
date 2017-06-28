private
libraryInstallationPath
	"Return a folder path where we should install a Moz2D library"
	<return: #FileReference>
	| path |
	
	"try to install in VM folder"
	path := self libraryDirectory.
	(path exists and: [ path isWritable ])
		"try to install in image folder"
		ifFalse: [ path := Smalltalk vm imagePath asFileReference parent ].
	(path exists and: [ path isWritable ])
		"try to install in working directory"
		ifFalse: [ path := FileSystem disk workingDirectory ].
	
	^ path