configuration
urlPath
	"Return a textual representation of a plugin path in a download provider, for example:
	Moz2D/osx/development/i386/libMoz2D.dylib"
	<return: #String>

	^ 'Moz2D/',
		self libraryPlatform, '/',
		self libraryVersion,'/',
		self libraryArch, '/',
		self libraryName