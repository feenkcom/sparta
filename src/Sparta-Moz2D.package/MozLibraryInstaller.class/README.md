I am an abstract Moz2D library installer.

I download and install Moz2D library. I define a few abstract methods that should be implemented by my platform specific subclasses.

I use ZnClient to download plugin and than install it in a propriate location, near pharo vm.

Public API and Key Messages

- download - download plugin under temporary name
- install - move plugin to vm's directory and name it accordingly

   MozLibraryInstaller install
 
Internal Representation and Key Implementation Points.

	I add extention method #mozLibraryInstaller to OSPlatform