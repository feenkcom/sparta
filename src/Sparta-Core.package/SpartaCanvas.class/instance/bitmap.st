api
bitmap
	"Return a surface bitmap factory.
	It allows developers to create surfaces from various sources,
	for example from a Form or a picture on the disk.
	See !SpartaBitmapBuilder 'bitmap' protocol for available api.

	canvas bitmap fromForm: (Smalltalk ui icons iconNamed: #classIcon).
	canvas bitmap fromFileNamed: 'images/kitty.jpg'
	"
	<return: #SpartaBitmapBuilder>
	
	^ self bitmapBuilder
		reset;
		canvas: self;
		yourself