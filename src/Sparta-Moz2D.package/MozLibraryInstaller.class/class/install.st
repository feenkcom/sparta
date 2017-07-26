installation
install
	<spartaPostLoad>
	
	^ Smalltalk platform mozLibraryInstaller new
		download;
		install;
		yourself